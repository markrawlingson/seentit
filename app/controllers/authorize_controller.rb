class AuthorizeController < ApplicationController
    
    def index
        w = Redd.it(:web, ENV["CLIENT_ID"], ENV["SECRET"], redirect_uri, user_agent: "Seentit v0.1")
        w.auth_url("random_state", ["mysubreddits"], :permanent)
        access = w.authorize!(params[:code])
        session[:access] = access.to_json
    end
    
    def new
        redirect_to "https://www.reddit.com/api/v1/authorize?client_id=#{ENV["CLIENT_ID"]}&response_type=code&state=RANDOM_STRING&redirect_uri=#{redirect_uri}&duration=permanent&scope=mysubreddits"
    end
    
end
