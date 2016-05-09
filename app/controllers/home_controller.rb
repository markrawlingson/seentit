class HomeController < ApplicationController

    def index
        u = Redd.it(:userless, ENV["CLIENT_ID"], ENV["SECRET"])
        u.authorize!
        @listings = u.get_hot("wallpapers", {:limit => 6})
    end
    
end
