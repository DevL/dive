defmodule Measure do
  def list_length(list) do
    list_length(list, 0)
  end

  defp list_length([], counter) do
    counter
  end

  defp list_length([_head|tail], counter) do
    list_length(tail, counter + 1)
  end
end

# iex(13)> Measure.list_length [1, 2, 'FIZZ']
# 3
