class LaughTracksApp < Sinatra::Base
  get '/comedians' do
    @comedians = Comedian.all
    @average_age = Comedian.average_age
    @average_run_time = Special.average_run_time
    erb :"comedians/index"
  end
end
