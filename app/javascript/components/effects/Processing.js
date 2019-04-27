import React from "react"
import PropTypes from "prop-types"
import { Container, Progress, Segment } from 'semantic-ui-react'

class Processing extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      maxProgress: props.maxProgress,
      processingText: props.processingText,
      progress: props.startPosition,
      stepDelay: props.stepDelay
    }
  }

  componentDidMount() {
    setInterval(() => this.updateProgress(), this.state.stepDelay)
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }

  updateProgress() {
    if (this.state.progress >= this.state.maxProgress) {
      return;
    }

    var new_progress = this.state.progress + 1;
    this.setState({ progress: new_progress });
  }

  render () {
    return (
      <React.Fragment>
        <Segment inverted>
          <Progress percent = {this.state.progress} inverted progress color='blue'>
            <p>{this.state.processingText}</p>
          </Progress>
        </Segment>
      </React.Fragment>
    );
  }
}

Processing.propTypes = {
  startPosition: PropTypes.node,
  stepDelay: PropTypes.node
};
export default Processing
