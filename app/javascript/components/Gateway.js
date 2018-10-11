import React from "react"
import PropTypes from "prop-types"
import strings from "../services/l10n"

class Gateway extends React.Component {
  constructor(props) {
    super(props);

    strings.setLanguage(props.locale || "en");
  }

  render () {
    return (
      <div>
        <h1>Welcome to StitchFix</h1>
        <br/>
        <h2>How It Works</h2>
        <div>
          {strings.how_it_works}
        </div>
        <br/>
        <h3>Register Now!</h3>

        {this.props.children}

      </div>
    );
  }
}

export default Gateway
