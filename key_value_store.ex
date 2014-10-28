defmodule KeyValueStore do
  def start_link do
    {:ok, spawn_link(fn -> loop(%{}) end)}
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop map
      {:put, key, value} ->
        loop Map.put(map, key, value)
    end
  end

  def register do
    {:ok, pid} = start_link
    Process.register(pid, :key_value_store)
  end

  def get(key) do
    send :key_value_store, {:get, key, self}
    receive do
      value -> value
    end
  end

  def put(key, value) do
    send :key_value_store, {:put, key, value}
  end
end
