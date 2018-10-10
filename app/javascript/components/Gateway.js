import React from "react"
import PropTypes from "prop-types"
class Gateway extends React.Component {
  constructor(props) {
    super(props);
  }
  render () {
    return (
      <div>
        <h1>Welcome to StitchFix</h1>
        <br/>
        <h3>Register Now!</h3>

        {this.props.children}

      </div>
    );
  }
}

export default Gateway
