# Homepage (Root path)
get '/' do
  erb :index
end

get '/tracks' do
  @tracks = Track.all
  erb :'tracks/index'
end

get '/tracks/new' do
  erb :'tracks/new'
end

post '/tracks' do
  @track= Track.new(
    author: params[:author],
    song_title: params[:song_title],
    url:  params[:url]
  )
  @track.save
  redirect '/tracks'
end