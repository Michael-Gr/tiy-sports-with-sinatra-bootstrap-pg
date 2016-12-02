require 'sinatra'
require 'pg'

get '/' do
  database = PG.connect(dbname: "tiy-sports")
  @teams = database.exec("
    SELECT    count(players.id), teams.name, teams.description,   teams.image_url
    FROM      players, teams, memberships
    WHERE     memberships.team_id = teams.id
    AND       memberships.player_id = players.id
    GROUP BY  teams.id, teams.name, teams.description, teams.image_url
    ")
  erb :home
end
