import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { receiveSearchGiphys, fetchSearchGiphys } from './actions/giphy_actions';

document.addEventListener("DOMContentLoaded", () => {
    const store = configureStore();
    const root = document.getElementById("root");
    window.fetchSearchGiphys = fetchSearchGiphys;
    window.receiveSearchGiphys = receiveSearchGiphys;
    window.store = store;
    ReactDOM.render(<Root store={store} />, root);

});