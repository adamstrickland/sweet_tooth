import LocalizedStrings from 'react-localization';

var data = fetch("/api/l10n").then(res => res.json())
let strings = new LocalizedStrings(data);
export default strings
