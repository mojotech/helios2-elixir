defmodule Helios2Web.PageController do
  use Helios2Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
