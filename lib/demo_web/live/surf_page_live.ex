defmodule DemoWeb.SurfPageLive do
  use Surface.LiveView

  alias DemoWeb.Header

  def render(assigns) do
    ~F"""
    <Header text="Manfred"/>
    <h1 class="text-center text-xl" x-data="{ message: 'I ❤️ Alpine, if it is working' }" x-text="message"></h1>
    """
  end
end
