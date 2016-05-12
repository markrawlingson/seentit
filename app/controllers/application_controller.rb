class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :redirect_uri
  
  before_action :default
  def default
    u = Redd.it(:userless, ENV["CLIENT_ID"], ENV["SECRET"])
    u.authorize!
    @subreddits = u.get("/subreddits/default.json").body[:data][:children]
  end

  def redirect_uri
     "#{request.protocol}#{request.host}#{authorize_index_path}"
  end
end
