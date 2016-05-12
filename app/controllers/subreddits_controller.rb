class SubredditsController < ApplicationController
    
    def index
        u = Redd.it(:userless, ENV["CLIENT_ID"], ENV["SECRET"])
        u.authorize!
        @listings = u.get_hot(subreddit)
        # load user subreddits
        if session[:access]
            session_access = Redd::Access.from_json(session[:access])
            w = Redd.it(:web, ENV["CLIENT_ID"], ENV["SECRET"], redirect_uri, user_agent: "Seentit v0.1")
            w.auth_url("random_state", ["mysubreddits"], :permanent)
            w.with(session_access) do |client|
                client.refresh_access! if session_access.expired?
                @subreddits = client.get("/subreddits/mine/subscriber").body[:data][:children]
                # override subreddit specific listings to get user's front page if name param doesn't exist
                if params[:name].nil?
                    @listings = u.get_hot(@subreddits.map { |r| "#{r[:data][:url].sub("/r/", "").sub("/", "")}"}.join("+"))
                end
            end
        end
    end
    
    private
        def subreddit
            params[:name] || "wallpapers+wallpaper"
        end
    
end
