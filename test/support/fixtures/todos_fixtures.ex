defmodule ElixTdapp.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixTdapp.Todos` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        done: true,
        id: 42,
        title: "some title"
      })
      |> ElixTdapp.Todos.create_todo()

    todo
  end
end
