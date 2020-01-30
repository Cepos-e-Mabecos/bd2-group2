import React from 'react';
import { BrowserRouter, Route } from 'react-router-dom';

import Login from './pages/Login';
import Main from './pages/Main';
import Ementas from './pages/Ementas';
import Funcionarios from './pages/Funcionarios';
import Alergias from './pages/Alergias';
import Itens from './pages/Itens';
import Consumos from './pages/Consumos';

export default function Routes() {
  return (
    <BrowserRouter>
      <Route path='/' exact component={Login} />
      <Route path='/restaurantes/:id' component={Main} />
      <Route path='/ementas/:id' component={Ementas} />
      <Route path='/funcionarios/:id' component={Funcionarios} />
      <Route path='/alergias' component={Alergias} />
      <Route path='/itens' component={Itens} />
      <Route path='/consumos' component={Consumos} />
    </BrowserRouter>
  );
}
