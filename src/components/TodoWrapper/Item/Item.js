import React, { Component } from 'react';
import PropTypes from 'prop-types'

class Item extends Component {
  handleChange = (e) => this.props.update(this.props.obj, !e.target.checked)

  labelClass() {
    if (this.props.obj.active) { return '' }
    return 'inActive'
  }
  render() {
    return (
      <p className='todoItem'>
        <label className={ 'checkContainer ' + this.labelClass() }>
          { this.props.obj.name }
          <input
            type="checkbox"
            onChange={ this.handleChange }
          />
          <span className="mark" />

        </label>
      </p>
    )
  }
}

Item.propTypes = {
  obj: PropTypes.object.isRequired,
  update: PropTypes.func.isRequired
}

export default Item
