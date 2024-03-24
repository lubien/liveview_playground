defmodule LiveviewPlayground.ErrorView do
  def render(template, _), do: Phoenix.Controller.status_message_from_template(template)
end
