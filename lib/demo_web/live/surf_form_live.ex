defmodule DemoWeb.SurfFormLive do
  use Surface.LiveView

  alias Surface.Components.Form
  alias Surface.Components.Form.{DateTimeLocalInput, Field, Label, TextInput, TextArea}

  require Logger

  data user, :map, default: %{"name" => "leer", "email" => "", "dateTime" => to_string(DateTime.utc_now())}

  def render(assigns) do
    ~F"""
      <Form for={:user} change="change" submit="submit" opts={autocomplete: "off"} >
        <Field name="name">
          <Label/>
          <div class="control">
            <TextInput value={@user["name"]} />
          </div>
        </Field>
        <Field name="email">
          <Label/>
          <div class="control">
            <DateTimeLocalInput value={@user["dateTime"]} />
          </div>
        </Field>
        <Field name="email">
          <Label/>
          <div class="control">
            <TextInput value={""} />
          </div>
        </Field>
      </Form>
    """
  end

  def handle_event("change", %{"user" => params}, socket) do
    IO.inspect(params)
    {:noreply, assign(socket, :user, params)}
  end

  def handle_event("submit", _, socket) do
    Logger.info("submit called")
    {:noreply, socket}
  end
end
