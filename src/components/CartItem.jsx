// Componente para a página ShoppingCart que mapeia cada item adicionado ao carrinho
import React, { Component } from 'react';
import { Link } from 'react-router-dom';

export default class CartItem extends Component {
  render() {
    const { id, title, price, thumbnail } = this.props.product;
    return (
      <div data-testid="product">
        <img src={thumbnail} alt={title} />
        <h4 data-testid="shopping-cart-product-name">{title}</h4>
        <p>{id}</p>
        <p>{`R$ ${price}`}</p>
        <Link data-testid="product-detail-link" to={`/product/${id}`}>
          VER DETALHES
        </Link>
        <p>quant</p>
      </div>
    );
  }
}
