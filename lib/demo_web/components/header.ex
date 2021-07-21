defmodule DemoWeb.Header do
  use Surface.Component

  prop text, :string

  def render(assigns) do
    ~F"""
    <div class="text-center text-2xl bg-blue-100">Hello, {@text}</div>
    """
  end
end
