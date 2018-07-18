import React, { Component } from 'react';
import PropTypes from 'prop-types'

class Item extends Component {
  render() {
    return (
      <p className='todoItem'>{ this.props.name }</p>
    )
  }
}

Item.propTypes = {
  name: PropTypes.string.isRequired
}

export default Item
