defmodule ElixTdappWeb.Components.TodoList do
  use Phoenix.Component
  import ElixTdappWeb.CoreComponents

  attr :todos, :list, required: true

  def todo_list(assigns) do
    ~H"""
    <div class="space-y-2 mt-7">
      <%= if Enum.empty?(@todos) do %>
        <div class="text-center p-8">
          <p class="text-gray-500">No todos yet. Add your first todo to get started!</p>
        </div>
      <% else %>
        <%= for todo <- @todos do %>
          <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow">
            <div class="flex items-center gap-3">
              <input
                type="checkbox"
                checked={todo.done}
                phx-click="toggle"
                phx-value-id={todo.id}
                class="h-4 w-4 text-indigo-600 rounded border-gray-300 focus:ring-indigo-500"
              />
              <span class={if todo.done, do: "line-through text-gray-500", else: ""}>
                <%= todo.title %>
              </span>
            </div>
            <button
              phx-click="delete"
              phx-value-id={todo.id}
              class="text-red-600 hover:text-red-800"
            >
              <.icon name="hero-trash" class="w-5 h-5" />
            </button>
          </div>
        <% end %>
      <% end %>
    </div>
    """
  end
end
