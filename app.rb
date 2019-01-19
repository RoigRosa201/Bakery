require 'sinatra'
require 'sendgrid-ruby'
require_relative './class.rb'
# require_relative './mail.rb'

get '/' do
  erb :home
end

get '/muffins' do
  @mymuffins = [@@chocmuffin,@@sauerkraut,@@filled,@@reeses,@@blueberry,@@caravan,@@lemon,@@almond,@@sugfree,@@bran,@@guavmuff,@@valmuff]
  erb :muffins
end

get '/cookies' do
  @mycookies = [@@chocolate,@@gingerbread,@@oatmeal,@@peanutbutter,@@rasberry,@@sugarfree,@@hibiscus,@@heart,@@tart,@@donut,@@frost,@@vanilla]
  erb :cookies
end

get'/cakes' do
  @mycakes = [@@diaper,@@wedding,@@fudge,@@pineapple,@@mario,@@short,@@kiwi,@@cherry,@@newyork,@@guava,@@pumpkin,@@butter]
  erb :cakes
end

get '/contact' do

  erb :contact
end


post '/contact' do 
  puts params.inspect
  from = SendGrid::Email.new(email:'roigrosa88@gmail.com')
  to = SendGrid::Email.new(email: params[:email])
  subject = "Marios sweets menu"
  content = SendGrid::Content.new(type: 'text/plain', value:
  "Thank you:"

   )
   
  mail = SendGrid::Mail.new(from, subject, to, content)
  
  sg = SendGrid::API.new(api_key:ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  puts response.status_code
  puts response.body
  # puts response.parsed_body
  puts response.headers
  redirect "/confirm"
  
end 
# get'/contact' do
#   erb :contact
# end

# post "/contact" do
#   from = "faustrosado@gmail.com"
#   to = params[:email].to_s
#   catalog = erb :catalog 
#   SGMail.new(from, to, catalog)
  
  
  # email = params[:email].to_s
  # puts email
  # send_mail(email)
  


get '/confirm' do 
  erb :confirm
end


# get "/catalog" do
#   erb :catalog
# end

# post  "/mail do

