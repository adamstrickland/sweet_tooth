import React from "react"
import PropTypes from "prop-types"
import strings from "../services/l10n"
// import LocalizedStrings from 'react-localization';

// let strings = new LocalizedStrings({
//   en:{
//     how_it_works: "Looking for that new sweater for the season? Sign up, fill out a profile, and we take care of the rest!"
//   },
//   en_GB:{
//     how_it_works: "Chuffed for a new jumper for the season? Sign up, fill out a profile, and we take care of the rest!"
//   }
// })

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
