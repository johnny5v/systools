
import React, { Component } from 'react';
import { render } from 'react-dom';
import Hello from './Hello';
import './style.css';

class App extends Component {
  constructor() {
    super();
    this.state = {
      name: 'React',
      showme: "no"
    };
       
  }
componentWillMount(){
   this.getData();
   
}

getData = () =>{
    fetch('https://api.github.com/users/johnny5v')
    .then(function(response) {
      return response.json();
    }
    )
    .then(resp=> { this.setState({showme: resp.login})})
}

  render() {
    console.log(this.state.showme);

    if ( this.state.showme === "johnny5v" ){
       return <div>RealContent, render what I want!</div>
    } else{
       return <div>loading</div>
    }
    
  }
}

render(<App />, document.getElementById('root'));
