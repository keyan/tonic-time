defmodule TonicTime.TimeChannel do
  use TonicTime.Web, :channel

  def broadcast_update(time) do
    html = Phoenix.View.render_to_string(TonicTime.PageView, "index.html", [time_now: time])
    TonicTime.Endpoint.broadcast("time:now", "update", %{html: html})
  end

  def join("time:now", _params, socket) do
    {:ok, socket}
  end
end
