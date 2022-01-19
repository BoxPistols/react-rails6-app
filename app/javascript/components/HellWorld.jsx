import React from 'react'
import PropTypes from 'prop-types'
class HellWorld extends React.Component {
	render() {
		return <React.Fragment>Greeting: {this.props.greeting}</React.Fragment>
	}
}

HellWorld.propTypes = {
	greeting: PropTypes.string,
}
export default HellWorld
