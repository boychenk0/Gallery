Resque::Server.use(Rack::Auth::Basic) do |user, password|
  user == 'admin@example.com'
  password == 'password'
end

