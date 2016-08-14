class User < ApplicationRecord
  has_secure_password

  @@token = "7quZD1eVssdopbgtTWXx75IiABBFkEPV"
  @@header = {'Authorization' => "Bearer #{@@token}"}

  def appointments
    HTTParty.get('https://external-api-gateway.development.carecloud.com/v2/appointments', headers: @@header)
  end
end
