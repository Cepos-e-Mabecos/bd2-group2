import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import Modal from 'react-modal';

import './Core.css';

import api from '../services/api';
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

export default function Itens() {
    const [itens, setItens] = useState([]);
    const [modalIsOpen, setIsOpen] = useState(false);
    const [state, setState] = React.useState({
        cod_tipoitem: "iEQzDgtEMw",
        custo: "",
        designacao: ""
    })

    useEffect(() => {
        async function loadInfo() {
            const response = await api.get(`/itens`);

            setItens(response.data["message"]);
        }

        loadInfo();
    }, []);

    async function handleRemove(id) {
        await api.delete(`/itens/${id}/`);

        setItens(itens.filter(item => item.cod_item !== id));
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

        await api.post(`/itens/`, state, {
            headers: { "Content-Type": "application/json" }
        });

        window.location.reload();
    }

    return (
        <div className='main-container'>
            <Link to="/" style={{ textDecoration: 'none' }}>
                <h1>Itens</h1>
            </Link>
            {itens.length > 0 ? (
                <ul>
                    {itens.map(item => (
                        <li key={item.cod_item}>
                            <footer>
                                <p><strong>Codigo Item: </strong> {item.cod_item}</p>
                                <p><strong>Codigo Tipo Item: </strong> {item.cod_tipoitem}</p>
                                <p><strong>Custo: </strong> {item.custo}</p>
                                <p><strong>Designacao: </strong>{item.designacao}</p>
                            </footer>

                            <div className='buttons'>
                                <button type='button' onClick={() => handleRemove(item.cod_item)}>
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
                    <h2>Adicionar Alergia</h2>
                    <button onClick={closeModal}>close</button>
                    <form onSubmit={handleSubmit}>
                        <label>
                            Designacao:
                            <input
                                type="text"
                                name="designacao"
                                onChange={handleChange}
                            />
                        </label>

                        <label>
                            Custo:
                            <input
                                type="text"
                                name="custo"
                                onChange={handleChange}
                            />
                        </label>

                        <label>Tipo Item:  
                            <select name="cod_tiporefeicao" onChange={handleChange} value={state.cod_tiporefeicao}>
                                <option key="iEQzDgtEMw" value="iEQzDgtEMw">Liquido</option>
                                <option key="PowJfLXyqQ" value="PowJfLXyqQ">Sólido</option>
                            </select>
                        </label>
                        <button type='submit'>Adicionar</button>

                    </form>
                </div>
            </Modal>
        </div>
    );
}
