import Alpine from "alpinejs"

// Bring phoenix_html to deal with method=PUT/DELETE in forms and buttons
import "phoenix_html"
import { Socket } from "phoenix"
import LiveSocket from "phoenix_live_view"
import NProgress from "nprogress"

window.Alpine = Alpine
Alpine.start()

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {
    params: { _csrf_token: csrfToken },
    dom: {
        onBeforeElUpdated(from, to) {
            if (from._x_dataStack) {
                window.Alpine.clone(from, to);
            }
        }
    }
})

// connect if there are any LiveViews on the page
liveSocket.connect()

// Show progress bar on live navigation and form submits
window.addEventListener("phx:page-loading-start", info => NProgress.start())
window.addEventListener("phx:page-loading-stop", info => NProgress.done())

window.liveSocket = liveSocket
// Uncomment below to bring Phoenix' client side socket
// import socket from "./socket"

// You can bring dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "./vendor/some-package.min.js"
//
// Alternatively, you can `npm install some-package` and import
// them using a path starting with the package name:
//
//     import "some-package"
//
