module TokenAuthentication
  extend ActiveSupport::Concern

  def current_user
    @current_user ||= User.find_by_auth_token_and_validate(access_token)
  end

  def access_token
    @access_token ||= begin
      bearer   = request.headers["HTTP_AUTHORIZATION"]
      bearer ||= request.headers["rack.session"].try(:[], 'Authorization')
      bearer.try(:split).try(:last)
    end
  end
end
