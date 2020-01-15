import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import Modal from 'react-modal';

import './Core.css';

import api from '../services/api';
import logo from '../assets/ementas.jpg';
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

export default function Ementas({ match }) {
  const [ementas, setEmentas] = useState({});
  const [tiposEmenta, setTiposEmenta] = useState([]);
  const [tiposRefeicao, setTiposRefeicao] = useState([]);
  const [modalIsOpen, setIsOpen] = useState(false);
  const [state, setState] = React.useState({
    cod_dataementa: "tPirSbDCiw",
    cod_restaurante: match.params.id,
    cod_tipoementa: "Vegetariana",
    cod_tiporefeicao: "Pequeno-almoco",
  })

  useEffect(() => {
    async function loadInfo() {
      const response = await api.get(`/ementas`);
      const response1 = await api.get(`/tiposementa`);
      const response2 = await api.get(`/tiposrefeicao`);

      const aux = response.data["message"].filter(ementa => ementa.cod_restaurante === match.params.id);
      setEmentas(aux);
      setTiposEmenta(response1.data["message"]);
      setTiposRefeicao(response2.data["message"]);
    }

    loadInfo();
  }, [match.params.id]);

  async function handleRemove(id) {
    await api.delete(`/ementas/${id}/`);

    setEmentas(ementas.filter(ementa => ementa.cod_ementa !== id));
  }


  function handleTipoEmenta(id) {
    const aux = tiposEmenta.filter(tipo => tipo.cod_tipoementa === id);

    return aux.length > 0 ? aux[0].designacao : "Não possui Tipo de Ementa";
  }

  function handleTipoRefeicao(id) {
    const aux = tiposRefeicao.filter(refeicao => refeicao.cod_tiporefeicao === id);

    return aux.length > 0 ? aux[0].designacao : "Não possui Tipo de Refeicao";
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
    await api.post(`/ementas`, state, {
      headers: {"Content-Type": "application/json"}
    });

    this.props.history.push(`/ementas/${match.params.id}`);
}

  return (
    <div className='main-container'>
      <Link to="/" style={{ textDecoration: 'none' }}>
        <h1>Ementas</h1>
      </Link>
      {ementas.length > 0 ? (
        <ul>
          {ementas.map(ementa => (
            <li key={ementa.cod_ementa}>
              <img src={logo} alt={ementas} />
              <footer>
                <p><strong>Codigo:</strong> {ementa.cod_ementa}</p>
                <p><strong>Tipo ementa: </strong>{handleTipoEmenta(ementa.cod_tipoementa)}</p>
                <p><strong>Tipo refeição: </strong>{handleTipoRefeicao(ementa.cod_tiporefeicao)}</p>
                <p><strong>Preço: </strong>{ementa.preco}</p>
              </footer>

              <div className='buttons'>
                <button type='button' onClick={() => handleRemove(ementa.cod_ementa)}>
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

        <h2>Adicionar Ementa</h2>
        <button onClick={closeModal}>close</button>
        <form onSubmit={handleSubmit}>
          <label>
            Codigo Restaurante:
          <input
              type="text"
              name="cod_restaurante"
              value={state.cod_restaurante}
              onChange={handleChange}
              disabled
            />
          </label>

          <select name="cod_tiporefeicao" onChange={handleChange} value={state.cod_tiporefeicao}>
            <option key="hwHmv0WTNg" value="hwHmv0WTNg">Pequeno-almoco</option>
            <option key="Z-RHTrpYrw" value="Z-RHTrpYrw">Almoco</option>
            <option key="PBro7fErQQ" value="PBro7fErQQ">Jantar</option>
            <option key="vAXxfT8m0Q" value="vAXxfT8m0Q">Outro</option>
          </select>

          <select name="cod_tipoementa" onChange={handleChange} value={state.cod_tipoementa}>
            <option key="H1jv3QlW8w"  value="H1jv3QlW8w">Vegetariana</option>
            <option key="QCA6-9vvoA"  value="QCA6-9vvoA">Carne</option>
            <option key="eP9EHVayqA"  value="eP9EHVayqA">Peixe</option>
            <option key="Bv506M5dQA"  value="Bv506M5dQA">Dieta</option>
            <option key="4HWoLSl28Q"  value="4HWoLSl28Q">Outro</option>
          </select>
          <button type='submit'>Adicionar</button>

        </form>
      </Modal>
    </div>
  );
}
