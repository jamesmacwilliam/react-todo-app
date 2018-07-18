import React, { Component } from 'react';
import Search from './Search'
import Item from './Item'

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
    let todos = this.state.todos
    todos.push(val)
    this.setState({ todos: todos })
  }
  render() {
    let todos = this.state.todos.map((todo) => {
      return (
        <Item
         key={ todo }
         name={ todo }
       />
      )
    })
    return (
      <div className="todoWrapper">
        <Search
          update={ this.updateSearch }
          submit={ this.addTodo }
        />
        { todos }
      </div>
    )
  }
}

export default TodoWrapper
