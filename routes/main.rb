module HafezWeb
  class MainApp < Sinatra::Base
    
    get '/' do
      haml :main
    end
    
    get '/contact' do
      haml :contact
    end
    
    get '/about' do
      haml :about
    end
    
  end  
end