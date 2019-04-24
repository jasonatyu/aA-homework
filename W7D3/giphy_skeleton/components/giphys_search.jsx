import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
    constructor(props) {
        super(props);
        this.state = {search_term: ""};
        this.handleChange = this.handleChange.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleChange(e) {
        this.setState({search_term: e.target.value });
    }

    handleSubmit(e) {
        e.preventDefault();
        this.props.fetchSearchGiphys(this.state.search_term)
        .then((res) => console.log(res));
        this.setState({search_term: ""});
    }

    render() {
        return (
            <div>
                <form onSubmit={this.handleSubmit}>
                    <input id="gif_search" type="text" onChange={this.handleChange} value={this.state.search_term}/>
                    <button>Search for GIF</button>
                </form>
                {this.props.giphys.data ? <GiphysIndex giphys={this.props.giphys.data} /> : ""}
            </div>

     
        );
    }
}

export default GiphysSearch;