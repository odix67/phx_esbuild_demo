defmodule DemoWeb.PageLive do
  use DemoWeb, :live_view

  def render(assigns) do
    ~L"""
    <p class="text-center text-2xl">page content</p>
    """
  end
end
