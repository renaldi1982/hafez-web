module HafezWeb

  class MainApp < Sinatra::Base
    #register sinatra validation method so we can use our helpers function        
    register Sinatra::ParamHashiefier
    register Sinatra::Flash
    helpers Sinatra::RedirectWithFlash    
    helpers Sinatra::JSON           
    
    #set path for layout and views
    set :haml, :layout => :'layout'
    set :views, Proc.new { File.join(root, "../views") }
  end
    
end