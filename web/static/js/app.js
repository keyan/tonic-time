import "phoenix_html"
import {Socket} from "phoenix"

let container = document.getElementById("clock")

let socket = new Socket("/time/socket")
socket.connect()

let timeChannel = socket.channel("time:now")

// When an `update` message is received we replace the contents
// of the "clock" element with server-side rendered HTML.
timeChannel.on("update", ({html}) => container.innerHTML = html)

timeChannel.join()
  .receive("ok", resp => console.log("joined time channel", resp))
  .receive("error", reason => console.log("failed to join", reason))
