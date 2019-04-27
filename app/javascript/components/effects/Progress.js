import React from "react"
import PropTypes from "prop-types"
class Progress extends React.Component {
  render () {
    return (
      <React.Fragment>
        Start Position: {this.props.startPosition}
        Step Delay: {this.props.stepDelay}
      </React.Fragment>
    );
  }
}

Progress.propTypes = {
  startPosition: PropTypes.node,
  stepDelay: PropTypes.node
};
export default Progress
