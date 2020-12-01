import React from 'react';

import SearchBar from '../components/SearchBar';
import * as api from '../services/api';
import ProductDisplay from '../components/ProductDisplay';
import CartIcon from '../components/CartIcon';
import CategoryList from '../components/CategoryList';

class ProductList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      categoryId: '',
      query: '',
      boxCheck: false,
      cartProduct: [],
      count: 0,
      categories: [],
      productsList: '',
    };
    this.handleClick = this.handleClick.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.toCart = this.toCart.bind(this);
  }

  componentDidMount() {
    api.getCategories().then((category) => {
      this.setState({ categories: category });
    });
  }

  async handleClick(input) {
    await api.getProductsFromCategoryAndQuery(this.state.categoryId, input)
      .then((data) => {
        sessionStorage.setItem('items', JSON.stringify(data.results));
        this.setState({
          productsList: data.results,
          query: input,
        });
      });
  }

  async handleChange(category) {
    const { boxCheck } = this.state;
    this.setState({ boxCheck: !boxCheck });
    if (!boxCheck) {
      this.setState({ categoryId: category });
    } else {
      this.setState({ categoryId: '' });
    }
    // --------- GAMBETA ------------
    await api.getProductsFromCategoryAndQuery(!boxCheck ? category : '', this.state.query)
      .then((data) => {
        sessionStorage.setItem('items', JSON.stringify(data.results));
        this.setState({ productsList: data.results });
      });
  }

  async toCart(product) {
    await this.setState({ cartProduct: [...this.state.cartProduct, product] });
    localStorage.setItem('inCart', JSON.stringify(this.state.cartProduct));
    // localStorage.setItem('inCart', JSON.stringify(this.state.product))
    // cartItem.push(JSON.parse(localStorage.getItem('inCart')))
    // localStorage.setItem('inCart', JSON.stringify(cartItem))
  }
  render() {
    return (
      <section>
        <CategoryList categories={this.state.categories} handleChange={this.handleChange} />
        <section className="products-container">
          <h1 data-testid="home-initial-message">
            Digite algum termo de pesquisa ou escolha uma categoria.
          </h1>
          <SearchBar onClick={this.handleClick} />
          <CartIcon />
          <div>
            { sessionStorage.getItem('items') && JSON.parse(sessionStorage.getItem('items'))
              .map((i) => <ProductDisplay addCart={this.toCart} key={i.id} product={i} />) }
          </div>
        </section>
      </section>
    );
  }
}

export default ProductList;
