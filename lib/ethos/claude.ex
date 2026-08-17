defmodule Ethos.Claude do
  @moduledoc "Behaviour for the two AI calls in the system. See spec §4."

  @callback parse_dump(raw_text :: String.t(), destination :: String.t()) ::
              {:ok, [map()]} | {:error, term()}

  @callback pick_nearby(destination :: String.t(), existing_names :: [String.t()], candidates :: [map()]) ::
              {:ok, [map()]} | {:error, term()}

  def impl, do: Application.get_env(:ethos, :claude, Ethos.Claude.API)
end
