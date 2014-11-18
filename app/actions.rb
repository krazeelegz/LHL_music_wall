# Homepage (Root path)
get '/' do
  session[:user] = 'Krish'
  erb :index 
end

get '/logout' do
  session[:id] = nil
  redirect '/tracks'
end

get '/login' do
  redirect '/tracks' if logged_in?
  erb :'auth/login'
end

post '/login' do
  @user = User.find_by(email: params[:email])
  if @user
    if @user.password == params[:password]
      session[:id] = @user.id
      redirect '/tracks'
    else
      erb :'auth/login_wrong_pw'
    end
  else
    erb :'auth/login_wrong_pw'
  end
end

get '/signup' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password]
  )
  if @user.save
    redirect '/tracks'
  else
    erb :'users/new'
  end
end


get '/tracks' do
  @tracks = Track.all
  erb :'tracks/index'
end

get '/tracks/new' do
  erb :'tracks/new'
end

get '/tracks/new' do
  if logged_in?
    @track = Track.new
    erb :'tracks/new'
  else
    redirect '/login'
  end
end

post '/tracks' do
  @track = Track.new(
    title: params[:title],
    url: params[:url],
    user_id: session[:id]
  )
  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end
