import React from "react"
import PropTypes from "prop-types"
import { Button, Container, Form, Grid, Header, Icon, Input, Label, Modal, Segment } from 'semantic-ui-react'

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
      redirectDelay: props.redirectDelay,
      userNameInput: '',
      passwordInput: '',
      loginResultText: '',
      loginResultIcon: ''
    }
  }

  handleFormInputChange(e, {name, value}) {
    this.setState({ [name]: value} );
  }

  handleLogin() {
    if (this.state.passwordInput == this.state.correctPassword) {
      this.setState({
        loginResultText: this.state.accessGrantedText,
        loginResultIcon: 'check circle',
        loginResultIconColor: 'green'
      });
    } else {
      this.setState({
        loginResultText: this.state.accessDeniedText,
        loginResultIcon: 'ban',
        loginResultIconColor: 'red'
      });
    }
  }

  render() {
    return (
      <React.Fragment>
        <Grid textAlign='center' style={{ height: '100vh' }} verticalAlign='middle'>
          <Grid.Column style={{ maxWidth: 450 }}>
            <Header as='h2' color='teal' textAlign='center'>{this.state.headerText}</Header>
            <Segment inverted>
              <Form onSubmit={this.handleLogin.bind(this)}>
                <Header inverted>{this.state.usernameLabel}</Header>
                <Form.Field inverted>
                  <Form.Input 
                    placeholder={this.state.usernamePlaceholder} 
                    name='userNameInput'
                    onChange={this.handleFormInputChange.bind(this)}
                  />
                </Form.Field>
                <Header inverted>{this.state.passwordLabel}</Header>
                <Form.Field inverted>
                  <Form.Input
                    type='password'
                    name='passwordInput'
                    onChange={this.handleFormInputChange.bind(this)}
                  />
                </Form.Field>
                <Modal trigger={<Button>{this.state.loginButtonLabel}</Button>}>
                  <Segment inverted placeholder>
                    <Header inverted icon as='h1' textAlign='center'>
                      <Icon size='massive'
                            name={this.state.loginResultIcon} 
                            color={this.state.loginResultIconColor} />
                      <Header.Content>{this.state.loginResultText}</Header.Content>
                    </Header>
                  </Segment>
                </Modal>
              </Form>
            </Segment>
          </Grid.Column>
        </Grid>
      </React.Fragment>
    );    
  }
}

export default Access
