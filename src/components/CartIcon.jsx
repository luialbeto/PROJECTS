import React from 'react';
import { Link } from 'react-router-dom';

export default class CartIcon extends React.Component {
  render() {
    return (
      <div>
        <Link data-testid="shopping-cart-button" to="/shopping-cart">
          <img src="https://image.flaticon.com/icons/png/512/263/263142.png" alt="cart icon" style={{ width: '30px' }} />
        </Link>
      </div>
    );
  }
}
