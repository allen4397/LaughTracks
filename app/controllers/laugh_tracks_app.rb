class LaughTracksApp < Sinatra::Base
  get '/comedians' do
    erb :"comedians/index"
  end
end
