class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    session_success(resource) && return if current_user

    session_failed
  end

  def session_success(resource)
    render json: { message: ['You are logged in.'], status: true, role: resource.role }, status: :ok
  end

  def session_failed
    render json: { message: ['Invalid Credentials'], status: false }
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: { message: ['You are logged out.'] }, status: :ok
  end

  def log_out_failure
    render json: { message: ['Hmm nothing happened.'] }, status: :unauthorized
  end
end
