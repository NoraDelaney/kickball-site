require 'sinatra'
require 'json'
require 'pry'

def get_data
  teams = File.read('roster.json')
  teams = JSON.parse(teams)
end

get_data

get '/teams' do
  teams = get_data
  erb :index, locals: {teams: teams}
end

get '/teams/:roster' do
  teams = get_data
  erb :show, locals: { name: params[:roster], teams: teams }
end

set :views, File.join(File.dirname(__FILE__), "views")
set :public_folder, File.join(File.dirname(__FILE__), "public")
