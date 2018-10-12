import LocalizedStrings from 'react-localization';

var strings = fetch("/api/l10n")
             .then((res) => res.json())
             .then((json) => new LocalizedStrings(json))
export default strings
