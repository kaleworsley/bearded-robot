module AuthorizationSystem
  NotAuthorized = Class.new(StandardError)
  AuthorizationNotChecked = Class.new(StandardError)

  protected

  def authorize!
    @authoriztion_checked = true
    raise NotAuthorized unless yield
  end

  def validate_authorization_checked
    return if @authoriztion_checked
    raise AuthorizationNotChecked
  end  
end
