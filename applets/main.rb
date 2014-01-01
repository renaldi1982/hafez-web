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
        # go through each file in the type vehicle folder and modified the file extension to uppercase
        Dir['./public/images/inventory/' + type + '/*.*'].each do |f|
          # check if all files have extension .JPG
          if File.extname(f) != "JPG"
            FileUtils.mv f, "#{File.dirname(f)}/#{File.basename(f,'.*')}.JPG"
          end          
        end
        images = Dir['./public/images/inventory/' + type + '/*.JPG']          
      end
      
      def show_dirs
        
      end
    end
  
  end        
end