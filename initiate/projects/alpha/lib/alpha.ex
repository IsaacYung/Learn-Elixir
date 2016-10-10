defmodule Alpha do
  use Application

  def start(_type, _args) do
    Alpha.Supervisor.start_link
  end
end
