import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';

import './Main.css';

import api from '../services/api';

export default function Main({ match, history }) {
    const [restaurante, setRestaurante] = useState({});


    useEffect(() => {
        async function loadInfo() {
            const response = await api.get(`/restaurantes/${match.params.id}`);
            setRestaurante(response.data["message"]);
            console.log(response.data["message"]);
        }

        loadInfo();
    }, [match.params.id]);

    return (
        <div className='main-container'>
            <Link to='/' style={{ textDecoration: 'none' }}>
                <h1>{restaurante.designacao}</h1>
            </Link>
            <ul>
                <li><button onClick={() => history.push(`/ementas/${match.params.id}`)}>Ementas</button></li>
                <li><button onClick={() => history.push(`/funcionarios/${match.params.id}`)}>Funcionarios</button></li>
                <li><button onClick={() => history.push(`/itens/${match.params.id}`)}>Itens</button></li>
                <li><button onClick={() => history.push(`/alergias`)}>Alergias</button></li>
                <li><button onClick={() => history.push(`/consumos/${match.params.id}`)}>Consumos</button></li>
            </ul>
        </div>
    );
}