defmodule Helios2.Clients.DarkSky do
  def forecast(lat, lng) do
    Darkskyx.forecast(lat, lng)
  end
end
