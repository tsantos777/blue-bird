Rails.application.routes.draw do

    # 404/500 pages
    get 'errors/not_found'
    get 'errors/internal_server_error'
    match "/404", to: "errors#not_found", via: :all
    match "/500", to: "errors#internal_server_error", via: :all
  
  #devise_scope :admins do
  #  # Redirests signing out users back to sign-in
  #  get "admins", to: "devise/sessions#new"
  #end

  devise_for :admins, controllers: { registrations: "registrations", sessions: "sessions" }
  #root "pages#home"
  root "pages#template_start"

  #post 'uploader/image', to: 'uploader#image' #add upload image to posts 
  #get 'blog', to: 'posts#index', as: :blog
  #resources :posts
  
  #resources :discover_flights
  #resources :messages
  #resources :enrollments
  #resources :book_downloads
  #resources :checkouts
  #resources :quiz_results

  # Enrollment form
  #get 'enroll-at-simplifly', to: 'enrollments#new', as: :enroll
  #get 'enrollment-confirmation', to: 'enrollments#confirmation', as: :enroll_confirmation

  # Contact form
  #get 'contact', to: 'messages#new', as: :contact
  #get 'contact-confirmation', to: 'messages#confirmation', as: :contact_confirmation
  #get 'visit-simplifly', to: 'messages#location', as: :location
  #get 'instruct-at-simplifly', to: 'messages#cfi', as: :cfi

  # Book Download
  #get 'book-download-confirmation', to: 'book_downloads#confirmation', as: :book_download_confirmation

  # Discovery flight form
  #get 'discovery-flight', to: 'discover_flights#new', as: :discovery_flight
  #get 'discovery-flight-confirmation', to: 'discover_flights#confirmation', as: :discovery_confirmation

  # Check out form
  #get 'rental-checkout', to: 'checkouts#new', as: :rental_checkout
  #get 'rental-checkout-confirmation', to: 'checkouts#confirmation', as: :checkout_confirmation

  # Quiz form
  #get 'quiz', to: 'quiz_results#new', as: :quiz
  #get 'quiz-confirmation', to: 'quiz_results#confirmation', as: :quiz_confirmation

  # Static Pages
  #get 'stratus-finance', to: 'pages#stratus', as: :stratus
  #get 'meritize', to: 'pages#meritize', as: :meritize
  #get 'accelerated-pilot-training', to: 'pages#accelerated', as: :accelerated
  #get 'flexible-pilot-training', to: 'pages#flexible', as: :flexible
  #get 'why-simplifly', to: 'pages#why_simplifly', as: :why_simplifly
  #get 'financing', to: 'pages#financing', as: :financing
  #get 'pilot-training-pricing-calculator', to: 'pages#cost' 
  #get 'approximate-pilot-training-costs', to: 'pages#cost', as: :cost
  #get 'timeline-to-be-a-pilot', to: 'pages#timeline', as: :timeline
  #get 'multi-engine-rating', to: 'pages#multi', as: :multi
  #get 'commercial-pilot-training', to: 'pages#commercial', as: :commercial
  #get 'instrument-rating', to: 'pages#instrument', as: :instrument
  #get 'private-pilot-training', to: 'pages#private_pilot', as: :private_pilot
  #get 'pilot-training', to: 'pages#pilot_training', as: :pilot_training
  #get 'airline-pilot-courses', to: 'pages#airline_pilot_courses', as: :airline_pilot_courses
  #get 'pilot-programs', to: 'pages#pilot_programs', as: :programs
  #get 'our-team', to: 'pages#our_team', as: :our_team
  #get 'terms-of-service-privacy-policy', to: 'pages#tos', as: :tos
  #get 'aircraft-rental', to: 'pages#aircraft_rental', as: :aircraft_rental
  #get 'fixed-wing-airplane-fleet', to: 'pages#fixed_wing', as: :fixed_wing
  #get 'rotary-wing-helicopter-fleet', to: 'pages#rotary_wing', as: :rotary_wing
  #get 'airplane-pilot-training', to: 'pages#airplane_training', as: :airplane_training
  #get 'helicopter-pilot-training', to: 'pages#helicopter_training', as: :helicopter_training
  #get 'about-ideal-aviation', to: 'pages#about_us', as: :about_us
  #get 'advanced_training', to: 'pages#advanced_training', as: :advanced_training
  #get 'pilot-resources', to: 'pages#pilot_resources', as: :pilot_resources
  #get 'careers', to: 'pages#careers', as: :careers
  

  # Previous Site's Routes
  #get 'home/flight-training', to: 'pages#why_simplifly'
  #get 'program-pricing', to: 'pages#cost'
  #get 'programs', to: 'pages#pilot_training'
  #get 'book-a-flight', to: 'discover_flights#new'
  #get 'locations', to: 'messages#location'
  #get 'contact-us', to: 'messages#new'
  #get 'simplifying-your-training', to: 'pages#why_simplifly'
  #get 'flight-instructors', to: 'pages#our_team'
  #get 'category/pilot', to: 'pages#airline_pilot_courses'
  #get 'becoming-a-pilot-timeline', to: 'pages#timeline'
  #get 'private-pilots-license', to: 'pages#private_pilot'
end
