import React from "react"
import PropTypes from "prop-types"
import l10n from "../services/l10n"

class Gateway extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      strings: {}
    }
  }

  componentWillMount() {
    l10n.then((ls) => {
      var strings = ls
      strings.setLanguage(this.props.locale || "en")

      this.setState({
        strings: strings
      });
    })
  }

  render () {
    return (
      <div>
        <h1>Welcome to StitchFix</h1>
        <br/>
        <h2>How It Works</h2>
        <div>
          {this.state.strings.how_it_works}
        </div>
        <br/>
        <h3>Register Now!</h3>

        {this.props.children}

      </div>
    );
  }
}

export default Gateway
