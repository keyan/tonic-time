defmodule TonicTime.PageController do
  use TonicTime.Web, :controller

  alias TonicTime.TimeManager

  def index(conn, _params) do
    time_now = TimeManager.time_now()
    render conn, "index.html", [time_now: time_now]
  end
end
