class Message < ApplicationRecord
  before_validation :strip_phone_number
  #after_save :to_lacrm
  
  validates :name, presence: true
  validates :body, presence: { message: "Tell us how we can help" }
  validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "must be a valid 10-digit phone number" }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }

  def strip_phone_number
    self.phone = phone.to_s.gsub(/[-() ]/, "")
  end

  def to_lacrm
    api_key = ENV['LACRM_API']
    # Set the endpoint and headers
    endpoint = "https://api.lessannoyingcrm.com/v2/"
    headers = {
      "Authorization" => api_key,
      "Content-Type" => "application/json"
    }
    # Get the user ID
    user_payload = {
      "Function" => "GetUser",
      "Parameters" => {}
    }
    user_response = HTTParty.get(endpoint, headers: headers, body: user_payload.to_json)
    if user_response.code == 200
      user_id = JSON.parse(user_response.body)['UserId']
    else
      # Handle the error
      user_id = nil
    end

    # Create the contact
    contact_payload = {
      "Function" => "CreateContact",
      "Parameters" => {
        "IsCompany" => false,
        "AssignedTo" => user_id,  #need to just get the USER ID so I can avoid doin the get call each time..
        "Name" => "#{self.name}",
        "Email" => "#{self.email}",
        "Phone" => "#{self.phone}",
        "Background Info" => "Originated from contact form on website",
      }
    }


    

    response = HTTParty.post(endpoint, headers: headers, body: contact_payload.to_json)
    contact_id = JSON.parse(response.body)['ContactId']
    
    # DO I REALLY NEED TO SAVE THIS INTO THE DB??
    #if response.code == 200
    #  # API Contact created successfully
    #  self.lacrm_contact_id = JSON.parse(response.body)['ContactId']
    #else
    #  self.lacrm_contact_id = 0
    #end
    #self.lacrm_response_code = response.code
    #self.lacrm_response_body = response.body

    

    # Add a note
    note_payload = {
      "Function" => "CreateNote",
      "Parameters" => {
    #    "ContactId" => "#{self.lacrm_contact_id}", #removed bc we're not saving that value into DB. 
        "ContactId" => contact_id,
        "Note" => "#{self.body}",
      }
    }
    HTTParty.post(endpoint, headers: headers, body: note_payload.to_json)

  end  
end
