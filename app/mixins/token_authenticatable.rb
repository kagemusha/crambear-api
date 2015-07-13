module TokenAuthenticatable
  extend ActiveSupport::Concern

  included do |base|
    base.validate :valid_auth_token
  end

  module ClassMethods
    def find_by_auth_token_and_validate(auth_token = nil)
      return nil if auth_token.blank?
      obj = where(auth_token: auth_token).first
      return nil if obj.blank?
      unless obj.valid?
        obj.destroy_auth_token!
        return nil
      end
      obj
    end
  end

  def valid_auth_token
    return unless auth_token  # nil tokens cannot fail the validation here.
    begin
      jwt = decode_auth_token
    rescue JSON::JWS::VerificationFailed, JSON::JWT::InvalidFormat
      errors.add :auth_token, 'Signature verification failed' and return
    end
    errors.add :auth_token, 'Expired token' if jwt[:exp] && Time.at(jwt[:exp]).utc < Time.now.utc
    errors.add :auth_token, 'Payload id and object id mismatch' unless jwt[:sub] == self.id
  end

  def new_auth_token!
    self.update(auth_token: generate_auth_token)
  end

  def destroy_auth_token!
    self.update(auth_token: nil)
  end

  def config
    raise NotImplementedError.new
  end

  private

  def signing_key
    config['signing_key']
  end

  def expiry_hours
    config['expiry_hours']
  end

  def decode_auth_token
    JSON::JWT.decode(auth_token, signing_key).with_indifferent_access
  end

  def generate_auth_token
    claim = {
      iat: Time.now.utc.to_i,
      sub: self.id
    }

    claim[:exp] = (Time.now.utc + expiry_hours).to_i if expiry_hours
    jwt         = JSON::JWT.new(claim).sign signing_key
    jwt.to_s
  end
end
