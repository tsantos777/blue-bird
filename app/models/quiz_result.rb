class QuizResult < ApplicationRecord
  #validates :previous_training, presence: true, unless: -> { previous_training.blank? }
  before_validation :strip_phone_number
  after_save :to_lacrm

  validates :first_name, presence: true
  validates :last_name, presence: true
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
        "Name" => "#{self.first_name} #{self.last_name}",
        "Email" => "#{self.email}",
        "Phone" => "#{self.phone}",
        "Background Info" => "Originated from quiz form on website",
      }
    }


    

    response = HTTParty.post(endpoint, headers: headers, body: contact_payload.to_json)
    contact_id = JSON.parse(response.body)['ContactId']
    

    # Add a note
    note_payload = {
      "Function" => "CreateNote",
      "Parameters" => {
        "ContactId" => contact_id,
        "Note" => "
          What type of training are you interested in:  #{self.program}
    
          Why do you want to become a pilot: #{self.why_pilot}
          
          What are your aviation goals: #{self.goals}
          
          Do you have any previous training: #{self.previous_training}
          
          How do you learn best: #{self.learn_style}
          
          Do you prefer to have a lot of structure and clear expectations, or do you prefer a more flexible approach: #{self.structure}
        
          What kind of guidance and support would you prefer from your flight instructor: #{self.guidance}
        
          Do you know how a wing generates lift: #{self.wings_lift}
        
          Anything else you'd like us to know: #{self.comments}
        
          Selected Date: #{self.preferred_date}
          Selected Time: #{self.preferred_availability}
          Alternate Date: #{self.alternate_date}
          Alternate Time: #{self.alternate_availability}
        ",
      }
    }
    HTTParty.post(endpoint, headers: headers, body: note_payload.to_json)

  end  
end
