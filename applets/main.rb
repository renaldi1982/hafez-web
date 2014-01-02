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
    
    def base_path
      Dir.pwd + 'home/rey/hafez-web/public/images/inventory/'      
    end
                 
    def image_path(type)
      "../public/images/inventory/#{type}/"  
    end
                              
    def get_dir            
      if Dir.pwd == '/'
        # get working working directory          
        dir = Dir[base_path + '*/']         
      else
        # get all folders for listing (localhost)
        dir = Dir['./public/images/inventory/' + '*/']
      end                                          
    end
             
    def get_images(type)              
      if Dir.pwd == '/'
        # go through each file in the type vehicle folder and modified the file extension to uppercase
        Dir[image_path + '*.*'].each do |f|
          # check if all files have extension .JPG
          if File.extname(f) != ".JPG"
            FileUtils.mv f, "#{File.dirname(f)}/#{File.basename(f,'.*')}.JPG"
          end          
        end        
        images = Dir['./public/images/inventory/' + type + '/*.JPG']
      else
                
      end
                
    end
                
  end        
end