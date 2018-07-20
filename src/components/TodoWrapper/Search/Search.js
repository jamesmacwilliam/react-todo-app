import React, { Component } from 'react';
import PropTypes from 'prop-types'

class Search extends Component {
  handleSubmit = (e) => {
    e.preventDefault()
    this.props.submit(this.input.value)
    this.input.value = ''
  }
  handleInput = (e) => this.props.update(this.input.value)
  render() {
    return (
      <div className="searchWrapper">
        <form onSubmit={ this.handleSubmit }>
          <input
            ref={ element => this.input = element }
            className="searchInput"
            type="text"
            placeholder="Enter a new ToDo item..."
            onInput={ this.handleInput }
          />
        </form>
      </div>
    )
  }
}

Search.propTypes = {
  update: PropTypes.func.isRequired,
  submit: PropTypes.func.isRequired
}

export default Search
