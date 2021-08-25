defmodule DemoWeb.OpenLayers do
  use Surface.LiveComponent

  require Logger

  def mount(socket) do
    connected = connected?(socket)
    Logger.info("mount called with connected = #{connected}")
    {:ok, socket}
  end

  def render(assigns) do
    ~F"""
    <div class="h-full" :hook="FeatureMap" phx-update="ignore"></div>
    """
  end
end
