import React, { Component } from 'react';
import PropTypes from 'prop-types'

class Item extends Component {
  render() {
    return (
      <p className='todoItem'>{ this.props.obj.name }</p>
    )
  }
}

Item.propTypes = {
  obj: PropTypes.object.isRequired
}

export default Item
