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
  }
  updateSearch = (val) => this.setState({ query: val })
  addTodo = (val) => {
    let todos = this.state.todos
    todos.push({id: (new Date()).getTime(), active: true, name: val })
    this.setState({ todos: todos })
  }
  updateItemState = (changedTodo, active) => {
    let todos = this.state.todos.map((todo) => {
      if (changedTodo.id !== todo.id) { return todo }
      todo.active = active
      return todo
    })
    this.setState({ todos: todos })
  }
  render() {
    let todos = this.state.todos.map((todo) => {
      return (
        <Item
         key={ todo.id }
         obj={ todo }
         update={ this.updateItemState }
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
