defmodule Alpha.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [
      worker(Alpha.Registry, [Alpha.Registry]),
      supervisor(Alpha.Bucket.Supervisor, []),
      supervisor(Task.Supervisor, [[name: Alpha.RouterTasks]])
    ]

    supervise(children, strategy: :rest_for_one)
  end
end
