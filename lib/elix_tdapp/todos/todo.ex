defmodule ElixTdapp.Todos.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :done, :boolean, default: false
    field :title, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:id, :title, :done])
    |> validate_required([:id, :title, :done])
  end
end