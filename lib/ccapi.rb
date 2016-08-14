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

  def patient(ex_id)
    patient_url = "https://external-api-gateway.development.carecloud.com/v2/patients/#{ex_id}"
    response = HTTParty.get(patient_url, headers: @@header)
    json = JSON.parse(response.body)
  end

  def payment(ex_id)
    payment_url = "https://external-api-gateway.development.carecloud.com/v2/patients/#{ex_id}/insurances"
    response = HTTParty.get(payment_url, headers: @@header)
    json = JSON.parse(response.body)
  end

  def balance(ex_id)
    balance_url = "https://external-api-gateway.development.carecloud.com/v2/patients/#{ex_id}/balance"
    response = HTTParty.get(balance_url, headers: @@header)
    json = JSON.parse(response.body)
  end

  def confirmation(appointment_id)
    confirmation_url = "https://external-api-gateway.development.carecloud.com/v2/appointments/#{appointment_id}/confirmation"
    response = HTTParty.post(confirmation_url,
      body: { date_confirmed: Date.parse(Time.now.to_s).to_s,
        communication_method: "other",
        communication_outcome: "confirmed"
      }.to_json,
      headers: @@header)
  end

  def checkin(appointment_id)
    check_in_url = "https://external-api-gateway.development.carecloud.com/v2/appointments/#{appointment_id}/check_in"
    response = HTTParty.put(check_in_url, headers: @@header)
  end
end