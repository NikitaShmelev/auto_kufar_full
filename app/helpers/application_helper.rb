module ApplicationHelper
    # def logged_in?
    #     !!session[:user_id]
    # end

    # def current_user
    #     @current_user ||= User.find_by(session[:user_id]) if !!session[:user_id]
    # end
    def gravatar_url(user)
        gravatar_id = Digest::MD5::hexdigest(user.email).downcase
        url = "https://gravatar.com/avatar/#{gravatar_id}.png"
    end

end
