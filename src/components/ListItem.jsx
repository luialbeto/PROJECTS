import React, { Component } from 'react'

export default class ListItem extends Component {
  render() {
    return (
      <div>
        {this.props.title}
      </div>
    )
  }
}
