require 'ccapi'

class UserController < ApplicationController
  before_action :authorize

  def checkin_frontdesk
  end

  def checkin_success
  end

  def home
    @appointments = []
    api = CareCloudApi.new
    all_appointments = api.appointments
    all_appointments.each do |appointment|
      if appointment["appointment"]["patient"]["id"] == current_user.external_user_id
        @appointments << appointment["appointment"]
      end
    end
    @appointments

  end

  def index
  end

  def payment
  end

  def personal_form
  end

  def update_insurance
  end

  def update_personal
  end

  def upload_doc
  end

  private

    def authorize
      if current_user.nil?
        redirect_to login_url, alert: "Not authorized! Please log in."
      end
    end

end
