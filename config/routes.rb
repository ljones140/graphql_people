Rails.application.routes.draw do
  post '/query' => 'application#query'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/query'
  end
end
