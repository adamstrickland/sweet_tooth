import React from "react"
import PropTypes from "prop-types"
import Gateway from "./Gateway"
import Registration from "./Registration"
class UsGateway extends React.Component {
  render () {
    return (
      <Gateway>
        <Registration/>
      </Gateway>
    );
  }
}

export default UsGateway
