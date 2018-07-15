import React, { Component } from 'react';
import Search from './Search'

class TodoWrapper extends Component {
  render() {
    return (
      <div className="todoWrapper">
        <Search />
      </div>
    )
  }
}

export default TodoWrapper
