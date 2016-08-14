require 'httparty'

class CareCloudApi
  @@token = "7quZD1eVssdopbgtTWXx75IiABBFkEPV"
  @@header = {'Authorization' => "Bearer #{@@token}"}
  # appointments_url = 'https://external-api-gateway.development.carecloud.com/v2/appointments'

  def appointments
    appointments_url = 'https://external-api-gateway.development.carecloud.com/v2/appointments'
    response = HTTParty.get(appointments_url, headers: @@header)
    json = JSON.parse(response.body)
  end
end