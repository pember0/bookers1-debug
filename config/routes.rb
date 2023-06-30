Rails.application.routes.draw do
  #トップ画面に設定
  root to: 'homes#top'

  #ルーティングを一括して自動生成してくれる機能
  resources :books
end
