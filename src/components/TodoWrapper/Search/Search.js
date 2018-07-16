import React, { Component } from 'react';
import PropTypes from 'prop-types'

class Search extends Component {
  constructor() {
    super()
    this.input = React.createRef()
    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleInput = this.handleInput.bind(this)
  }
  handleSubmit(e) {
    e.preventDefault()
    this.props.submit(this.input.current.value)
    this.input.current.value = ''
  }
  handleInput(e) {
    this.props.update(this.input.current.value)
  }
  render() {
    return (
      <div className="searchWrapper">
        <form onSubmit={ this.handleSubmit }>
          <input
            ref={ this.input }
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
