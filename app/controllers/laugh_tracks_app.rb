class LaughTracksApp < Sinatra::Base
  get '/comedians' do
    @comedians = Comedian.all
    @average_age = Comedian.average_age
    @average_run_time = Special.average_run_time
    @unique_cities = Comedian.unique_cities
    erb :"comedians/index"
  end
end
