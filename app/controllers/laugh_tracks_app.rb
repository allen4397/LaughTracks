class LaughTracksApp < Sinatra::Base
  get '/comedians' do
    if params[:age]
      @comedians = Comedian.where("age = ?", params[:age])
      @specials = @comedians.map {|comedian| comedian.specials}.flatten
      @average_age = params[:age].to_f
      @average_run_time = @specials.sum {|special| special.run_time}/@specials.count.to_f if @specials.count != 0
      @unique_cities = @comedians.map {|comedian| comedian.city}.flatten.uniq.join", "
    else
      @comedians = Comedian.all
      @specials = Special.all
      @average_age = Comedian.average_age
      @average_run_time = Special.average_run_time
      @unique_cities = Comedian.unique_cities
    end
    erb :"comedians/index"
  end

  get '/comedians/new' do
    erb :"comedians/new"
  end
end
