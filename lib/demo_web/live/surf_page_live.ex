defmodule DemoWeb.SurfPageLive do
  use Surface.LiveView

  alias DemoWeb.Header
  alias DemoWeb.OpenLayers
  alias Surface.Components.Form
  alias Surface.Components.Form.{DateTimeLocalInput, Field, Label, TextInput}

  require Logger

  data user, :map, default: %{"name" => "leer", "dateTime" => to_string(DateTime.utc_now())}

  def mount(arg, session, socket) do
    connected = connected?(socket)
    Logger.info("#{__MODULE__} mount called with connected = #{connected}")
    Logger.info("arg: #{inspect(arg)}")
    Logger.info("session: #{inspect(session)}")
    Logger.info("socket: #{inspect(socket)}")
    {:ok, socket}
  end

  def terminate(reason, socket) do
    Logger.info("#{__MODULE__} terminate called with reason: #{inspect(reason)}")
    Logger.info("#{__MODULE__} terminate socket: #{inspect(socket)}")
  end

  def render(assigns) do
    ~F"""
        <div class="flex flex-col h-screen text-gray-800">
          <Header text="Manfred" />
          <div class="flex-1 bg-green-200">
            <OpenLayers id="featureMap" />
          </div>
         <div class="py-10 bg-gray-200">
            <h1 class="text-center text-xl" x-data="{ message: 'I like Alpine, when it is working' }" x-text="message"></h1>
            <Form for={:user} change="change" opts={autocomplete: "off"} >
              <Field name="name">
                <Label/>
                <div class="control">
                  <TextInput value={@user["name"]} />
                </div>
              </Field>
              <Field name="dateTime">
                <Label/>
                <div class="control">
                  <DateTimeLocalInput value={@user["dateTime"]} />
                </div>
              </Field>
            </Form>
          </div>
        </div>
    """
  end

  def handle_event("change", params, assigns) do
    IO.inspect(params)
    {:noreply, assigns}
  end
end
