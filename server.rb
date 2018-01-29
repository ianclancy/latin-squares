require "sinatra"
require "pry"
require "csv"
require_relative "models/square"

get "/" do
  redirect "/size-input"
end

get "/size-input" do
  erb :size_input
end

get "/enter-values/:square_size" do
  @square_size = params[:square_size].to_i
  erb :enter_values
end

get "/result" do
  @values_list = CSV.read("square_values.csv").last
  @square = Square.new(@values_list)
  @rows = @square.rows
  erb :result
end

post "/size-input" do
  square_size = params["square_size"]
  redirect "/enter-values/#{square_size}"
end

post "/enter-values/:square_size" do
  number_of_values = params[:square_size].to_i ** 2
  values_list = []
  i = 0
  while i < number_of_values
    values_list << params[i.to_s]
    i += 1
  end
  CSV.open("square_values.csv", "a") do |csv|
    csv.puts(values_list)
  end
  redirect "/result"
end
