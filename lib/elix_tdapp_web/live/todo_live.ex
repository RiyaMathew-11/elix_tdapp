defmodule ElixTdappWeb.TodoLive do
  use ElixTdappWeb, :live_view
  alias ElixTdapp.Todos
  import ElixTdappWeb.Components.TodoList
  require Logger

  @impl true
  def mount(_params, _session, socket) do
    todos = Todos.list_todos()
    {:ok, assign(socket, todos: todos, new_todo: "")}
  end

  @impl true
  def handle_event("add-todo", %{"todo" => %{"title" => title}} = _params, socket) do

    case Todos.create_todo(%{title: title, done: false}) do
      {:ok, _todo} ->
        {:noreply,
         socket
         |> assign(:todos, Todos.list_todos())
         |> assign(:new_todo, "")}

      {:error, changeset} ->
        Logger.error("Failed to create todo: #{inspect(changeset.errors)}")
        {:noreply, socket}
    end
  end

  @impl true
  def handle_event("toggle", %{"id" => id}, socket) do
    todo = Todos.get_todo(id)
    Todos.update_todo(todo, %{done: !todo.done})

    {:noreply, assign(socket, :todos, Todos.list_todos())}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    todo = Todos.get_todo(id)
    {:ok, _} = Todos.delete_todo(todo)

    {:noreply, assign(socket, :todos, Todos.list_todos())}
  end


end
