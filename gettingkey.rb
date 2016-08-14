require 'HTTParty'

authsite = "https://api.carecloud.com/oauth2/access_token"
tokenkey = "7quZD1eVssdopbgtTWXx75IiABBFkEPV"
header = {"Authorization" => "Bearer 7quZD1eVssdopbgtTWXx75IiABBFkEPV"}
patient_id = "95386fc0-c24c-4aa8-bab3-cd124ab535f7"

patientinfo = HTTParty.get("https://external-api-gateway.development.carecloud.com/v2/patients/""#{patient_id}", headers: header)


patientinfo = HTTParty.get("https://external-api-gateway.development.carecloud.com/v2/patients/95386fc0-c24c-4aa8-bab3-cd124ab535f7", headers: header)
# p patientinfo

puts patientinfo["patient"]["first_name"]
puts patientinfo["patient"]["last_name"]
puts patientinfo["patient"]["addresses"][0]["line1"]
puts patientinfo["patient"]["addresses"][0]["city"]
puts patientinfo["patient"]["addresses"][0]["state"]
puts patientinfo["patient"]["addresses"][0]["zip"]
puts patientinfo["patient"]["addresses"][0]["country_name"]
puts patientinfo["patient"]["phones"][0]["phone_number"]
p patientinfo["patient"]["marital_status"] #Needs to be set, none are set so it'll output nil
puts patientinfo["patient"]["insurance_profiles"][1]["insurance_policies"].first["member_number"]
puts patientinfo["patient"]["insurance_profiles"][1]["insurance_policies"].first["type"]

insurcopay = HTTParty.get("https://external-api-gateway.development.carecloud.com/v2/patients/95386fc0-c24c-4aa8-bab3-cd124ab535f7/insurances", headers: header)


puts insurcopay["insurance_profiles"][1]["insurance_policies"].first["co_payment"]

location = HTTParty.get("https://external-api-gateway.development.carecloud.com/v2/locations", headers: header)

puts location["locations"][0]["address"]["line1"]

appointment = HTTParty.get("https://external-api-gateway.development.carecloud.com/v2/appointments", headers: header)

puts appointment[0]["appointment"]["start_time"]
puts appointment[0]["appointment"]["location"]["name"]

# p patientinfo["insurance_profiles"].first["name"]
