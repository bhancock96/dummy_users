get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/login' do
end

post '/logout' do
end

get '/create' do

  erb :create_account
end

get '/secret' do
  if session[:id]
    erb :secret
  else  
   redirect '/login'
  end
end


