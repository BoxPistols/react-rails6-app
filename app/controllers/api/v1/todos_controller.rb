class Api::V1::TodosController < ApplicationController

	# 一覧
  def index
		# todos変数(複数) = モデルTodoのインスタンス、ソート追加古い順
    todos = Todo.order(updated_at: :desc)
		# todosのデータをJSON形式のデータで返却
    render json: todos
  end

	# 詳細
  def show
		# todos変数(単数) = モデルTodoのインスタンス、そのID該当のデータを探す
    todo = Todo.find(params[:id])
		# jsonのtodosから取得
    render json: todo
  end

	# 新規作成
  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: todo
    else
      render json: todo.errors, status: 422
    end
  end
	# 編集更新
  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_params)
      render json: todo
    else
      render json: todo.errors, status: 422
    end
  end
	# 削除
  def destroy
    if Todo.destroy(params[:id])
      head :no_content
    else
      render json: { error: "Failed to destroy" }, status: 422
    end
  end
	# 全体削除
  def destroy_all
    if Todo.destroy_all
      head :no_content
    else
      render json: { error: "Failed to destroy" }, status: 422
    end
  end

  private
	# セキュア
  def todo_params
    params.require(:todo).permit(:name, :is_completed)
  end
end