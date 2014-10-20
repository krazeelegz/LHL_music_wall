# Homepage (Root path)
get '/' do
  session[:user] = 'Krish'
  erb :index 
end

get '/signin' do
  erb :signin
end

post 'signin' do
  session[:user] = params[:users_name]
  redirect '/messages'
end



get '/tracks' do
  @tracks = Track.order(upvotes: :desc)
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
  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end

post '/tracks/:track_id/upvotes' do
  @track = Track.find(params[:track_id])
  @track.upvotes ||= 0
  @track.upvotes += 1
  # @upvote = @message.upvotes.new(user: current_user)
  @track.save
  redirect '/tracks'
end

get '/tracks/:id' do
  @track = Track.find params[:id]
  erb :'tracks/show'
end
