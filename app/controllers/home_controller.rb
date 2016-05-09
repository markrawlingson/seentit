class HomeController < ApplicationController

    def index
        u = Redd.it(:userless, ENV["CLIENT_ID"], ENV["SECRET"])
        u.authorize!
        @listings = u.get_hot("wallpapers+wallpaper", {:limit => 25}).sample(10)
    end
    
end
