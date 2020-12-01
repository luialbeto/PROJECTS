import React from 'react';

class ProductDetails extends React.Component {
  render() {
    const product = JSON.parse(sessionStorage.getItem('items'))
    .filter((item) => item.id === this.props.match.params.id)[0];
    return (
      <div data-testid="product-detail-name">
        {product.title}
      </div>
    );
  }
}

export default ProductDetails;
