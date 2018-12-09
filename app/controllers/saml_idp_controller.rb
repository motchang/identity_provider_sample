# frozen_string_literal: true

class SamlIdpController < SamlIdp::IdpController
  def idp_authenticate(_email, _password)
    user = User.find_by(email: params[:email])

    user&.valid_password?(params[:password]) ? user : nil
  end

  def idp_make_saml_response(user)
    encode_SAMLResponse(user.email)
  end
end
