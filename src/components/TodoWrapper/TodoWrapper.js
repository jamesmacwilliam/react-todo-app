import React, { Component } from 'react';
import Search from './Search'

class TodoWrapper extends Component {
  constructor() {
    super()
    this.state = {
      query: '',
      todos: []
    }
    this.updateSearch = this.updateSearch.bind(this)
    this.addTodo = this.addTodo.bind(this)
  }
  updateSearch(val) {
    this.setState({ query: val })
  }
  addTodo(val) {
    this.setState({ todos: this.state.todos.push(val) })
  }
  render() {
    return (
      <div className="todoWrapper">
        <Search
          update={ this.updateSearch }
          submit={ this.addTodo }
        />
      </div>
    )
  }
}

export default TodoWrapper
