import React, { Component } from 'react';
import PropTypes from 'prop-types'

class Item extends Component {
  render() {
    return (
      <p className='todoItem'>
        <label className="checkContainer">
          { this.props.obj.name }
          <input type="checkbox" />
          <span className="mark" />

        </label>
      </p>
    )
  }
}

Item.propTypes = {
  obj: PropTypes.object.isRequired
}

export default Item
