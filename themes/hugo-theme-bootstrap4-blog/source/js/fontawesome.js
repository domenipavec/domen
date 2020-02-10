import { library, dom } from '@fortawesome/fontawesome-svg-core'
import { faFolder, faTag, faEnvelope } from '@fortawesome/free-solid-svg-icons'
import { faFacebookF, faTwitter, faLinkedinIn, faGithub } from '@fortawesome/free-brands-svg-icons'

// Add solid icons to our library
library.add(faFolder, faTag, faEnvelope)

// Add brand icons to our library
library.add(faFacebookF, faTwitter, faLinkedinIn, faGithub)

// Replace any existing <i> tags with <svg> and set up a MutationObserver to
// continue doing this as the DOM changes.
dom.watch()
