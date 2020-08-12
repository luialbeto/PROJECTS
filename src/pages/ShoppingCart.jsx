import React from 'react';
import CartItem from '../components/CartItem';

class ShoppingCart extends React.Component {
  constructor(props) {
    super(props);
    this.state = { counter: 0 };
  }
  render() {
    return (
      <section data-testid="shopping-cart-empty-message" className="cart-container">
        <div>
          {localStorage.getItem('inCart') &&
            JSON.parse(localStorage.getItem('inCart')).map((item) => (
              <CartItem id={item.id} product={item} />
            ))
          }
        </div>
        Seu carrinho está vazio
      </section>
    );
  }
}

export default ShoppingCart;
