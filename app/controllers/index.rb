get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/login' do

  erb :login
end

post '/login' do 

  valid_user = User.authenticate(params[:email], params[:password])
  if valid_user
    session[:id] = valid_user.id

    redirect  '/secret'
  else
    redirect '/login'
  end
end

get '/logout' do
  session[:id] = nil

  redirect '/login'
end

post '/created_user' do
  user = User.create(params[:user])
  session[:id] = user.id
  
  redirect '/secret'
end

get '/register' do

  erb :create_account
end

get '/secret' do
  if session[:id]
    erb :secret
  else  
   redirect '/login'
  end
end


