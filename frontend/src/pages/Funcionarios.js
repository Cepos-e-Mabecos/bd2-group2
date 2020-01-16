import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import Modal from 'react-modal';

import './Core.css';

import api from '../services/api';
import logo from '../assets/funcionarios.png';
import dislike from '../assets/dislike.svg';

const customStyles = {
    content: {
        top: '50%',
        left: '50%',
        right: 'auto',
        bottom: 'auto',
        marginRight: '-50%',
        transform: 'translate(-50%, -50%)'
    }
};

export default function Funcionarios({ match }) {
    const [funcionarios, setFuncionarios] = useState([]);
    const [modalIsOpen, setIsOpen] = useState(false);
    const [state, setState] = React.useState({
        nome: "tPirSbDCiw",
        cod_localconsumo: "x-ypRN-DpQ",
    })

    useEffect(() => {

        async function loadInfo() {
            const response = await api.get(`/locaisconsumo`);
            const response1 = await api.get(`/funcionarios`);

            const aux = response.data["message"].filter(local => local.cod_restaurante === match.params.id);

            const aux2 = response1.data["message"].filter(a => aux.filter(func => func.cod_localconsumo === a.cod_localconsumo).length > 0 ? 1 : 0);

            setFuncionarios(aux2);
        }



        loadInfo();
    }, [match.params.id]);

    async function handleRemove(id) {
        await api.delete(`/funcionarios/${id}/`);

        setFuncionarios(funcionarios.filter(funcionario => funcionario.cod_funcionario !== id));
    }

    function closeModal() {
        setIsOpen(false);
    }

    function handleChange(e) {
        const value = e.target.value;
        setState({
            ...state,
            [e.target.name]: value
        });
    }

    async function handleSubmit(e) {
        e.preventDefault();

        console.log(state);
        await api.post(`/funcionarios/`, state, {
            headers: { "Content-Type": "application/json" }
        });

        window.location.reload();
    }

    return (
        <div className='main-container'>
            <Link to="/" style={{ textDecoration: 'none' }}>
                <h1>Funcionários</h1>
            </Link>
            {funcionarios.length > 0 ? (
                <ul>
                    {funcionarios.map(funcionario => (

                        <li key={funcionario.cod_funcionario}>
                            <img src={logo} alt={funcionario} />
                            <footer>
                                <p><strong>Codigo: </strong> {funcionario.cod_funcionario}</p>
                                <p><strong>Nome: </strong>{funcionario.nome}</p>
                                <p><strong>Local Consumo: </strong>{funcionario.cod_localconsumo}</p>
                                <p><strong>Ativo: </strong>{funcionario.ativo === true ? "Sim" : "Não"}</p>
                            </footer>

                            <div className='buttons'>
                                <button type='button' onClick={() => handleRemove(funcionario.cod_funcionario)}>
                                    <img src={dislike} alt='dislike' />
                                </button>
                            </div>
                        </li>
                    ))}
                </ul>
            ) : (
                    <div className='empty'>Acabou :/</div>
                )}
            <button type='button' onClick={() => setIsOpen(true)}>
                +
        </button>

            <Modal
                isOpen={modalIsOpen}
                onRequestClose={closeModal}
                style={customStyles}
                contentLabel="Example Modal"
            >
                <div className="modal-container">
                    <h2>Adicionar Ementa</h2>
                    <button onClick={closeModal}>close</button>
                    <form onSubmit={handleSubmit}>
                        <label>
                            Nome:
                            <input
                                type="text"
                                name="nome"
                                onChange={handleChange}
                            />
                        </label>

                        <label>Tipo Refeição:
                            <select name="cod_localconsumo" onChange={handleChange} value={state.cod_localconsumo}>
                                <option key="x-ypRN-DpQ" value="x-ypRN-DpQ">Esplanada</option>
                                <option key="tMXmBsMYbw" value="tMXmBsMYbw">Interior</option>
                            </select>
                        </label>

                        <button type='submit'>Adicionar</button>

                    </form>
                </div>
            </Modal>
        </div>
    );
}
