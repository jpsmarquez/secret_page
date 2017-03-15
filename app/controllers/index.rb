get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
erb :index
end

get '/log_out' do
  session.clear
  erb :index
end


get '/not_logged' do
  erb :not_logged
end

before '/secret' do
  unless session[:email]
    redirect to ('/not_logged')
  end
end

get '/secret' do

   # "WELCOME #{email}--#{password}"
   # session.clear
   erb :secret
end


get '/user_not_found' do
  erb :user_not_found
end

get '/user' do
 redirect to ("/secret")
end

post '/user' do
  @email = params[:email]
  password = params[:password]
  puts '*' * 1000
  p user = User.authenticate(@email, password)
  if user 
    session[:email] = @email
    redirect to ("/secret")
  else
   redirect to ("/user_not_found")
  end
end

post '/sign_in' do
name = params[:name]
email = params[:email]
password = params[:password]
@user = User.create(name: name, email: email, password: password) 
erb :sign_in
end

