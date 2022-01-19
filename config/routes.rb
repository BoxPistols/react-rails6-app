Rails.application.routes.draw do
  # ルート
  root to: redirect('/todos')
  # ルート/新規/編集/ 何が来ても site/index.html.erbに返す
  get 'todos', to: 'site#index'
  get 'todos/new', to: 'site#index'
  get 'todos/:id/edit', to: 'site#index'

  # 名前空間のapi/v1の指定
  namespace :api do
    namespace :v1 do
      # resourcesに無い特別なアクションdestroy_all
      delete '/todos/destroy_all', to: 'todos#destroy_all'
      # 上記以外はresourcesのデフォルト、下記以外は無いので指定する。
      resources :todos, only: %i[index show create update destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
