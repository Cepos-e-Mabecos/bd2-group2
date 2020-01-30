import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import Modal from 'react-modal';

import './Core.css';

import api from '../services/api';
import logo from '../assets/alergias.jpg';
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

export default function Alergias({ match }) {
    const [alergias, setAlergias] = useState([]);
    const [modalIsOpen, setIsOpen] = useState(false);
    const [state, setState] = React.useState({
        designacao: ""
    })

    useEffect(() => {
        async function loadInfo() {
            const response = await api.get(`/alergias`);

            setAlergias(response.data["message"]);
        }

        loadInfo();
    }, []);

    async function handleRemove(id) {
        await api.delete(`/alergias/${id}/`);

        setAlergias(alergias.filter(alergia => alergia.cod_alergia !== id));
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

        await api.post(`/alergias/`, state, {
            headers: { "Content-Type": "application/json" }
        });

        window.location.reload();
    }

    return (
        <div className='main-container'>
            <Link to="/" style={{ textDecoration: 'none' }}>
                <h1>Alergias</h1>
            </Link>
            {alergias.length > 0 ? (
                <ul>
                    {alergias.map(alergia => (

                        <li key={alergia.cod_alergia}>
                            <img src={logo} alt={alergia} />
                            <footer>
                                <p><strong>Codigo: </strong> {alergia.cod_alergia}</p>
                                <p><strong>Designacao: </strong>{alergia.designacao}</p>
                            </footer>

                            <div className='buttons'>
                                <button type='button' onClick={() => handleRemove(alergia.cod_alergia)}>
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

                        <button type='submit'>Adicionar</button>

                    </form>
                </div>
            </Modal>
        </div>
    );
}
