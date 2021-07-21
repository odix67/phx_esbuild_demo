defmodule DemoWeb.PageLive do
  use DemoWeb, :live_view

  def render(assigns) do
    ~L"""
    <p class="text-center text-2xl bg-gray-300">page content</p>
    <h1 x-data="{ message: 'I ❤️ Alpine' }" x-text="message"></h1>
    """
  end
end
