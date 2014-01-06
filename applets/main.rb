module HafezWeb
  class MainApp < Sinatra::Base                      
    
    configure do
      #register sinatra validation method so we can use our helpers function        
      register Sinatra::ParamHashiefier
      register Sinatra::Flash
      register Sinatra::Reloader
      helpers Sinatra::RedirectWithFlash    
      #helpers Sinatra::JSON
      
      #set path for layout and views
      set :haml, :layout => :'layout'
      set :views, Proc.new { File.join(root, "../views") }        
      
      #enable logging and settup the logging file location
      enable :logging
      file = File.new("/tmp/sinatra.log","a+")
      file.sync = true
      use Rack::CommonLogger, file  
    end    
        
    helpers do
      
      def abs_base_path
        Dir.pwd + 'home/rey/hafez-web/public/images/inventory/'      
      end
      
      def rel_base_path
        './public/images/inventory/'
      end                                         
                                       
      def get_dir    
                
        if Dir.pwd == '/'
          # get working working directory          
          dir = Dir[abs_base_path + '*/']         
        else
          # get all folders for listing (localhost)
          dir = Dir[rel_base_path + '*/']
        end
                                                  
      end
      
      def file_ext_check(type)          
        
        if Dir.pwd == '/'
          # go through each file in the type vehicle folder and modified the file extension to uppercase
          Dir[abs_base_path + type +'/*.*'].each do |f|                                
            # check if all files have extension .JPG if not then remove the files
            if File.extname(f) != ".JPG"              
              FileUtils.mv f, "#{File.dirname(f)}/#{File.basename(f,'.*')}.JPG"
            end          
          end
        else                            
          # go through each file in the type vehicle folder and modified the file extension to uppercase
          Dir[rel_base_path + type +'/*.*'].each do |f|                                
            # check if all files have extension .JPG if not then remove the files
            if File.extname(f) != ".JPG"              
              FileUtils.mv f, "#{File.dirname(f)}/#{File.basename(f,'.*')}.JPG"
            end          
          end
        end
                 
      end
                     
      def get_images(type)                                     
        if Dir.pwd == '/'                                     
          images = Dir[abs_base_path + type + '/*.JPG']
        else
          images = Dir['./public/images/inventory/' + type + '/*.JPG']        
        end                 
      end
      
    end        
                
  end        
end