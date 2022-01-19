import React from 'react'
import ReactDOM from 'react-dom'
import App from '../components/App'

document.addEventListener('DOMContentLoaded', () => {
	ReactDOM.render(
		<div>
			<App />
		</div>,
		document.querySelector('#root')
	)
})
