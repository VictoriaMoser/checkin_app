require 'ccapi'

class UserController < ApplicationController
  before_action :authorize
  before_action :get_patient, only: [:update_insurance, :update_personal, :payment]
  before_action :confirmation, only: [:checkin_frontdesk, :checkin_success]

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
    api = CareCloudApi.new
    @copay = api.payment(current_user.external_user_id)#["insurance_profiles"][1]["insurance_policies"].first["co_payment"]
    @balance = api.balance(current_user.external_user_id)[1]["total"]
    # api.
  end

  def personal_form
  end

  def update_insurance
  end

  def update_personal
    session[:appointment] = params[:id]
  end

  def upload_doc
  end

  private

    def authorize
      if current_user.nil?
        redirect_to login_url, alert: "Not authorized! Please log in."
      end
    end

    def get_patient
      api = CareCloudApi.new
      @patient_info = api.patient(current_user.external_user_id)["patient"]
    end

    def confirmation
      api = CareCloudApi.new
      @confirmation = api.confirmation(session[:appointment])
    end

end
