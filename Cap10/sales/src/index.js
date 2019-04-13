import React from 'react';
import ReactDOM from 'react-dom';
import './assets/index.css';
import App from './components/App';
import Productos from './components/Productos';
import * as serviceWorker from './serviceWorker';
import {BrowserRouter as Router,Route} from 'react-router-dom';


ReactDOM.render(<App />, document.getElementById('root'));

//Definiendo las rutas
ReactDOM.render(
    <Router>
        <Route exact path="/" component={App} />
        <Route exact path="/Productos" component={Productos} />
    </Router>,
    document.getElementById('root')
);


// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
