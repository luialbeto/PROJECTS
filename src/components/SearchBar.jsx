import React, { Component } from 'react'

export default class SearchBar extends Component {
  constructor(props) {
    super(props);
    this.state = { input: '' };
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event) {
    this.setState({ input: event.target.value });
  }

  render() {
    return (
      <div className="search-bar">
        <input
          type="text"
          placeholder="Digite algum termo de pesquisa ou escolha uma categoria"
          data-testid="query-input"
          onChange={this.handleChange}
        />
        <button
          onClick={() => this.props.onClick(this.state.input)}
          data-testid="query-button"
        >
          Pesquisar
        </button>
      </div>
    );
  }
}
