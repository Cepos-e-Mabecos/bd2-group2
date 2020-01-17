import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';

import './Core.css';

import api from '../services/api';
import dislike from '../assets/dislike.svg';

export default function Consumos() {
    const [consumos, setConsumos] = useState([]);
    const [funcionarios, setFuncionarios] = useState([]);
    const [clientes, setClientes] = useState([]);


    useEffect(() => {
        async function loadInfo() {
            const response = await api.get(`/consumos`);
            const response1 = await api.get("/funcionarios");
            const response2 = await api.get("/clientes");


            setConsumos(response.data["message"]);
            setFuncionarios(response1.data["message"]);
            setClientes(response2.data["message"]);
        }

        loadInfo();
    }, []);

    async function handleRemove(id) {
        await api.delete(`/consumos/${id}/`);

        setConsumos(consumos.filter(consumo => consumo.cod_consumo !== id));
    }

    function handleFuncionarios(id) {
        const aux = funcionarios.filter(funcionario => funcionario.cod_funcionario === id);

        return aux.length > 0 ? aux[0].nome : "";
    }

    function handleClientes(id) {
        const aux = clientes.filter(cliente => cliente.cod_cliente === id);

        return aux.length > 0 ? aux[0].nome : "";
    }

    return (
        <div className='main-container'>
            <Link to="/" style={{ textDecoration: 'none' }}>
                <h1>Consumos</h1>
            </Link>
            {consumos.length > 0 ? (
                <ul>
                    {consumos.map(consumo => (
                        <li key={consumo.cod_consumo}>
                            <footer>
                                <p><strong>Codigo Consumo: </strong> {consumo.cod_consumo}</p>
                                <p><strong>Codigo Cliente: </strong> {handleClientes(consumo.cod_cliente)}</p>
                                <p><strong>Codigo Funcionario: </strong> {handleFuncionarios(consumo.cod_funcionario)}</p>
                                <p><strong>Data Consumo: </strong> {consumo.data_consumo}</p>
                                <p><strong>Ementas Consumidas: </strong>{consumo.n_ementas_consumidas}</p>
                                <p><strong>Total: </strong>{consumo.total}</p>
                            </footer>

                            <div className='buttons'>
                                <button type='button' onClick={() => handleRemove(consumo.cod_consumo)}>
                                    <img src={dislike} alt='dislike' />
                                </button>
                            </div>
                        </li>
                    ))}
                </ul>
            ) : (
                    <div className='empty'>Acabou :/</div>
                )}
        </div>
    );
}
