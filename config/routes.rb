Rails.application.routes.draw do
  # Deviseのルーティング
  devise_for :users

  # 非ログイン時のトップページ（紹介ページ）
  unauthenticated do
    root to: "top#top"
  end

  # ログイン後のマイページをライブ記録一覧に設定
  authenticated :user do
    root to: "live_records#index", as: :mypage
  end

  # ライブ記録とセットリストのルーティング
  resources :live_records do
    resources :setlists, only: [ :create, :destroy ], shallow: true
  end

  # アーティスト登録・管理
  resources :artists

  # 不要な仮置きルートを削除
  # get "live_records/new" や get "live_records/create" は resources に含まれているため不要
  # get "users/show" は今使っていなければ削除、将来使うならコメントアウトなどで保留

  # その他のPWA設定（必要であればそのまま）
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Railsのヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check
end
