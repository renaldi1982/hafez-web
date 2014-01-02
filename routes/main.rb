# GOES TO CONFIGURATION
# to get the vehicle type without the directory
# d[/\.\/[\S]+\/[\S]+\/[\S]+\/([\S]+)\//ix,1]

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
    
    get '/listing' do
      # get listing folders
      @work_dir = get_dir 
      #@dir = get_dir                        
      haml :listing
    end
    
    get '/:id' do
      type = params.id            
      @images = get_images(type)            
      haml :gallery
    end
    
  end  
end