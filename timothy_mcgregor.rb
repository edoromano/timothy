require 'koala'
require 'sinatra'
require './timothy_mcbeth'
require 'pry'

before do
  oauth_access_token = 'EAACEdEose0cBAKp08nIPw8B2nnlFcRif84F346F0xifjZBy8yOJsDtRVTOhXpCcOXhNxE80i7azmboIN54w6QGLU0PHkrbGAC8ZBMLmuUJmVZC2Y2FGIR01porkM5euemCZAgqCXDM5GeqZArDzjLWTh9jIJrqiQcIGcBwIJniz0pbIhp7aXd'
  @graph = Koala::Facebook::API.new(oauth_access_token)
end

post '/speak' do
  message = TimothyMcBeth.browse
  array =  message.split("\n")
  if array.size == 1
    @graph.put_connections("me", "feed", { :link => array.first } )
  else
    @graph.put_connections("me", "feed", { :description => array.first, :link => array.last } )
  end
    return { :post => array }
end
