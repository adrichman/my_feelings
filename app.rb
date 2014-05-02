require "bundler/setup"
require "sinatra"
require "sinatra/activerecord"
require "rack-flash"

require './models.rb'

# Configuration
set :database, "sqlite3:///web_app.sqlite3"
set :sessions, true
enable :sessions
use Rack::Flash, sweep: true

get "/signup" do
  #renders the signup form
  erb :signup
end

post "/create-user" do
  #this will catch the signup form info
  # as params[:user]
  @user = User.create( params[:user] )

  if @user
    session[:user_id] = @user.id
    flash[:notice] = "Signed up successfully"

  else
    flash[:notice] = "Failed to signup. Please check your info."

    redirect "/signup"
  end
end











