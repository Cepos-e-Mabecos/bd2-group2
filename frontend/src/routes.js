import React from 'react';
import { BrowserRouter, Route } from 'react-router-dom';

import Login from './pages/Login';
import Main from './pages/Main';
import Ementas from './pages/Ementas';
import Funcionarios from './pages/Funcionarios';

export default function Routes() {
  return (
    <BrowserRouter>
      <Route path='/' exact component={Login} />
      <Route path='/restaurantes/:id' component={Main} />
      <Route path='/ementas/:id' component={Ementas} />
      <Route path='/funcionarios/:id' component={Funcionarios} />
    </BrowserRouter>
  );
}
