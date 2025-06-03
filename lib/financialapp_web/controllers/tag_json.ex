defmodule FinancialappWeb.TagJSON do
  alias Financialapp.Tags.Tag

  @doc """
  Renders a list of tags.
  """
  def index(%{tags: tags}) do
    %{tags: for(tag <- tags, do: data(tag))}
  end

  @doc """
  Renders a single tag.
  """
  def show(%{tag: tag}) do
    %{tag: data(tag)}
  end

  def data(%Tag{} = tag) do
    %{
      id: tag.id,
      name: tag.name
    }
  end
end
