import React from 'react';

class Calculator extends React.Component {
    constructor(props) {
        super(props);
        this.state = {result: 0, num1: "", num2: ""};
        this.setNum1 = this.setNum1.bind(this);
        this.setNum2 = this.setNum2.bind(this);
        this.multiply = this.multiply.bind(this);
        this.subtract = this.subtract.bind(this);
        this.add = this.add.bind(this);
        this.divide = this.divide.bind(this);
        this.reset = this.reset.bind(this);
    }

    reset(e) {
        e.preventDefault();
        this.setState({num1: "", num2: "", result: 0});
    }

    multiply(e) {
        e.preventDefault();
        const result = parseInt(this.state.num1) * parseInt(this.state.num2);
        this.setState({result: result});
    }

    add(e) {
        e.preventDefault();
        const result = parseInt(this.state.num1) + parseInt(this.state.num2);
        this.setState({ result: result });
    }

    divide(e) {
        e.preventDefault();
        const result = parseInt(this.state.num1) / parseInt(this.state.num2);
        this.setState({ result: result });
    }

    subtract(e) {
        e.preventDefault();
        const result = parseInt(this.state.num1) - parseInt(this.state.num2);
        this.setState({ result: result });
    }

    setNum1(e) {
        // your code here
        e.preventDefault();
        this.setState({num1: e.currentTarget.value});
    }

    setNum2(e) {
        // your code here
        e.preventDefault();
        this.setState({ num2: e.currentTarget.value });
    }

    // your code here

    render() {
        const { num1, num2, result } = this.state; 
        return (
            <div>
                <input type="text" onChange={this.setNum1} value={num1}></input>
                <input type="text" onChange={this.setNum2} value={num2}></input>
                <button onClick={this.multiply}>
                    *
                </button>
                <button onClick={this.subtract}>
                    -
                </button>
                <button onClick={this.add}>
                    +
                </button>
                <button onClick={this.divide}>
                    /
                </button>
                <button onClick={this.reset}>
                    Reset 
                </button>
                <h1>{result}</h1>
            </div>
        );
    }
}

export default Calculator;