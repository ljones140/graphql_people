Rails.application.routes.draw do
  post '/query' => 'application#query'
end
