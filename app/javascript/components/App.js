import React from "react";
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'

import styled from 'styled-components'
import AddTodo from './AddTodo'
import TodoList from './TodoList'
import EditTodo from './EditTodo'
import Nav from './Nav';
import './App.css'

const Logo = styled.div`
  font-weight: bold;
  font-size: 23px;
  letter-spacing: 3px;
	padding: 1vw;
`

const Wrapper = styled.div`
  width: 700px;
  max-width: 85%;
  margin: 20px auto;
`

export default function App() {
	return (
		<>
			<Router>
				<Logo>Logo</Logo>	
				{/* Nav Bar */}
				<Nav />
				<Wrapper>
					<Routes>
						<Route exact path="todos" component={<TodoList />} />
						<Route exact path="todos/new" component={<AddTodo />} />
						<Route path="todos/:id/edit" component={<EditTodo />} />
					</Routes>
				</Wrapper>
			</Router>
		</>
	);
}
