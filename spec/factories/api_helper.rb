module ApiHelper
  def authenticated_header(request, user)
    authentication = Devise::JWT::TestHelpers.auth_headers(request, user)
    request.headers.merge!(authentication)
  end
end
