require 'sinatra'
require 'pg'

get '/' do
  database = PG.connect(dbname: "tiy-sports")
  @teams = database.exec("SELECT * FROM teams")

  @memberships = database.exec("SELECT memberships.team_id FROM memberships")
  erb :home
end
