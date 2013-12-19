module HafezWeb
  class MainApp < Sinatra::Base
    
    get '/' do
      haml :index
    end
    
    get '/gallery' do
      haml :gallery
    end
    
    get '/contact' do
      haml :contact
    end
    
  end  
end