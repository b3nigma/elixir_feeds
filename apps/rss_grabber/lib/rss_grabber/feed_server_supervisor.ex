defmodule RssGrabber.FeedServerSupervisor do
  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_opts) do

    children = [
      worker(RssGrabber.FeedServer, [], restart: :transient)
    ]

    supervise children, strategy: :simple_one_for_one
  end
end