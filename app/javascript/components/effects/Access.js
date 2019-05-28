import React from "react"
import PropTypes from "prop-types"
import { Button, Container, Form, Grid, Header, Input, Label, Modal, Segment } from 'semantic-ui-react'

class Access extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      headerText: props.headerText,
      mode: props.mode,
      usernameLabel: props.usernameLabel,
      passwordLabel: props.passwordLabel,
      usernamePlaceholder: props.usernamePlaceholder,
      loginButtonLabel: props.loginButtonLabel,
      accessDeniedText: props.accessDeniedText,
      accessGrantedText: props.accessGrantedText,
      correctPassword: props.correctPassword,
      maxRetries: props.maxRetries,
      successRedirectUrl: props.successRedirectUrl,
      failureRedirectUrl: props.failureRedirectUrl,
      redirectDelay: props.redirectDelay
    }
  }

  render() {
    return (
      <React.Fragment>
        <Grid textAlign='center' style={{ height: '100vh' }} verticalAlign='middle'>
          <Grid.Column style={{ maxWidth: 450 }}>
            <Header as='h2' color='teal' textAlign='center'>{this.state.headerText}</Header>
            <Segment inverted>
              <Form>
                <Header inverted>{this.state.usernameLabel}</Header>
                <Form.Field inverted>
                  <input placeholder={this.state.usernamePlaceholder}></input>
                </Form.Field>
                <Header inverted>{this.state.passwordLabel}</Header>
                <Form.Field inverted>
                  <input placeholder={this.state.usernamePlaceholder}></input>
                </Form.Field>
                <Button>{this.state.loginButtonLabel}</Button>
              </Form>
            </Segment>
          </Grid.Column>
        </Grid>
      </React.Fragment>
    );    
  }
}

export default Access
