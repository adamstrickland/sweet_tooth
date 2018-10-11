import LocalizedStrings from 'react-localization';

//works
var data = require("json-loader!yaml-loader!../data/l10n.yml")
let strings = new LocalizedStrings(data);
export default strings
