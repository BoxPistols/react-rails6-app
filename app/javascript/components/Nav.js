import React from 'react';
import { Link } from 'react-router-dom'
import styled from 'styled-components'

const Nabvar = styled.nav`
  background: #dbfffe;
  min-height: 8vh;
  display: flex;
  justify-content: space-around;
  align-items: center;
`

const NavItems = styled.ul`
  display: flex;
  width: 400px;
  max-width: 40%;
  justify-content: space-around;
  list-style: none;
`

const NavItem = styled.li`
  font-size: 19px;
  font-weight: bold;
  opacity: 0.7;
  &:hover {
    opacity: 1;
  }
`

export default function Nav() {
  return (
    <>
      <Nabvar>
        <NavItems>
          <NavItem>
            <Link to='/todos'>Todos</Link>
          </NavItem>
          <NavItem>
            <Link to='/todos/new'>Add New Todo</Link>
          </NavItem>
        </NavItems>
      </Nabvar>
    </>
  );
}
 