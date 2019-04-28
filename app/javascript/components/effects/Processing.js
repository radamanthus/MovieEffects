import React from "react"
import PropTypes from "prop-types"
import { Button, Container, Header, Modal, Progress, Segment } from 'semantic-ui-react'

class Processing extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      maxProgress: props.maxProgress,
      processingText: props.processingText,
      progress: props.startPosition,
      stepDelay: props.stepDelay,
      timerStarted: false
    }
  }

  componentDidMount() {
    setInterval(() => this.updateProgress(), this.state.stepDelay)
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }

  startTimer() {
    this.setState({ timerStarted: true });
  }

  updateProgress() {
    if (!this.state.timerStarted) {
      return;
    }
    if (this.state.progress >= this.state.maxProgress) {
      return;
    }

    var new_progress = this.state.progress + 1;
    this.setState({ progress: new_progress });
  }

  render () {
    return (
      <React.Fragment>
        <Container>
          <Modal trigger={<Button onClick={this.startTimer.bind(this)}>Start</Button>}>
            <Segment inverted>
              <Progress percent = {this.state.progress} progress inverted color='blue'>
                <Header inverted size='medium'>{this.state.processingText}</Header>
              </Progress>
            </Segment>
          </Modal>
        </Container>
      </React.Fragment>
    );
  }
}

Processing.propTypes = {
  startPosition: PropTypes.node,
  stepDelay: PropTypes.node
};
export default Processing
