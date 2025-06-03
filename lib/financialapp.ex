defmodule Financialapp do
  defimpl Jason.Encoder, for: Decimal do
    def encode(decimal, opts) do
      Jason.Encode.string(Decimal.to_string(decimal), opts)
    end
  end
  @moduledoc """
  Financialapp keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
end
