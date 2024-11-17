# lib/elix_tdapp/todos.ex
defmodule ElixTdapp.Todos do
  import Ecto.Query
  alias ElixTdapp.Repo
  alias ElixTdapp.Todos.Todo
  require Logger

  def list_todos do
    Repo.all(from t in Todo, order_by: [desc: t.inserted_at])
  end

  def get_todo(id), do: Repo.get(Todo, id)

  def create_todo(attrs \\ %{}) do
    %Todo{}
    |> Todo.changeset(attrs)
    |> Repo.insert()
    |> case do
      {:ok, _todo} = result ->
        result
      error ->
        Logger.error("Failed to create todo in database: #{inspect(error)}")
        error
    end
  end

  def update_todo(todo, attrs) do
    todo
    |> Todo.changeset(attrs)
    |> Repo.update()
  end

  def delete_todo(todo), do: Repo.delete(todo)
end
