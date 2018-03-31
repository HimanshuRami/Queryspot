RailsAdmin.config do |config|
   config.excluded_models = ["Topic", "UserSubscribedTopic", "Category"] 
   #config.current_user_method(&:current_user)
   config.authorize_with do
    authenticate_or_request_with_http_basic('Site Message') do |username, password|
      username == 'admin' && password == 'admin'
    end
  end
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end