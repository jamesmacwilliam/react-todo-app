import React, { Component } from 'react';

class Search extends Component {
  render() {
    return (
      <div className="searchWrapper">
        <input className="searchInput" type="text" placeholder="Enter a new ToDo item..."></input>
      </div>
    )
  }
}

export default Search
