import React from "react"
import PropTypes from "prop-types"
import Gateway from "./Gateway"
import Registration from "./Registration"
class UkGateway extends React.Component {
  render () {
    return (
      <Gateway>
        <Registration>
          <div>
            <label>
              Postcode:
              <input name="postcode"/>
            </label>
          </div>
        </Registration>
      </Gateway>
    );
  }
}

export default UkGateway
