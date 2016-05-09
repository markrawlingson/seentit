class SubredditsController < ApplicationController
    
    def index
        u = Redd.it(:userless, ENV["CLIENT_ID"], ENV["SECRET"])
        u.authorize!
        @listings = u.get_hot(params[:name])
    end
    
end
