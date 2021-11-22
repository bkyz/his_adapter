Rails.application.routes.draw do
  mount HisAdapter::Engine => "/his_adapter"
  get "test", to: "demo#test"
end
