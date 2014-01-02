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
        # get working working directory
        dir = Dir[Dir.pwd + 'home/rey/hafez-web/public/images/inventory/' + '*/']
        # get all folders for listing (localhost)
        #dirs = Dir[work_dir + './public/images/inventory/' + '*/']                           
      end
               
      def get_images(type)                
        # go through each file in the type vehicle folder and modified the file extension to uppercase
        Dir['/home/rey/hafez-web/public/images/inventory/' + type + '/*.*'].each do |f|
          # check if all files have extension .JPG
          if File.extname(f) != ".JPG"
            FileUtils.mv f, "#{File.dirname(f)}/#{File.basename(f,'.*')}.JPG"
          end          
        end
        images = Dir['./public/images/inventory/' + type + '/*.JPG']          
      end
            
    end
  
  end        
end