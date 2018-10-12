import React from "react"
import PropTypes from "prop-types"
class Registration extends React.Component {
  render () {
    return (
      <form action="/dashboard" method="GET">
        <div>
          <label>
            First Name:
            <input name="first_name"/>
          </label>
        </div>
        <div>
          <label>
            Last Name:
            <input name="last_name"/>
          </label>
        </div>
        <div>
          <label>
            Email:
            <input name="email"/>
          </label>
        </div>

        {this.props.children}

        <div>
          <input type="submit"/>
        </div>
      </form>
    );
  }
}

export default Registration
