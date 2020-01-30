import React, { Component } from 'react';
import './Login.css';

import api from '../services/api';

class Login extends Component {
    constructor(props) {
        super(props);

        this.state = {
            restaurantes: [],
            value: "",
        };

    }

    componentDidMount() {
        api.get('/restaurantes')
            .then((res) => {
                this.setState({ restaurantes: res.data["message"] });
                this.setState({ value: res.data["message"][0].cod_restaurante });
            })
    }

    handleSubmit(e) {
        e.preventDefault();

        console.log(this.state.value);

        const { value } = this.state;

        this.props.history.push(`/restaurantes/${value}`);
    }

    render() {
        return (
            <div className='login-container'>
                <form onSubmit={this.handleSubmit.bind(this)}>
                    <h1>Restaurantes</h1>
                    <select onChange={(e) => this.setState({ value: e.target.value })} >
                        {this.state.restaurantes.map((x, i) => <option key={i} value={x.cod_restaurante}>{x.designacao}</option>)}
                    </select>
                    <button type='submit'>Selecionar</button>
                </form>
            </div>
        );
    }
}

export default Login;