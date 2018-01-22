require 'sinatra'
require 'pry'

get "/" do
  redirect "/size-input"
end

get "/size-input" do
  erb :size_input
end

post "/size-input" do
  square_size = params["square_size"]
  redirect "/enter-values/#{square_size}"
end

get "/enter-values/:square_size" do
  @square_size = params[:square_size].to_i
  erb :enter_values
end

post "/enter-values/:square_size" do
  redirect "/result"
end

get "/result" do
  erb :result
end
