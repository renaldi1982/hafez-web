module HafezWeb
  class MainApp < Sinatra::Base
    #register sinatra validation method so we can use our helpers function        
    register Sinatra::ParamHashiefier
    register Sinatra::Flash
    register Sinatra::Reloader
    helpers Sinatra::RedirectWithFlash    
    #helpers Sinatra::JSON           
    
    #set path for layout and views
    set :haml, :layout => :'layout'
    set :views, Proc.new { File.join(root, "../views") }        
  
    helpers do       
            
      def get_dir 
        # get all folders for listing
        dirs = Dir['./public/images/inventory/' + '*/']            
      end
               
      def get_images(type)
        images = Dir['./public/images/inventory/' + type + '/*.jpg']          
      end
      
      def show_dirs
        
      end
    end
  
  end        
end