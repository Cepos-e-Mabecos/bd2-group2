import React from 'react';
import { BrowserRouter, Route } from 'react-router-dom';

import Login from './pages/Login';
import Main from './pages/Main';
import Ementas from './pages/Ementas';

export default function Routes() {
  return (
    <BrowserRouter>
      <Route path='/' exact component={Login} />
      <Route path='/restaurantes/:id' component={Main} />
      <Route path='/ementas/:id' component={Ementas} />
    </BrowserRouter>
  );
}
