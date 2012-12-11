Dummy::Application.routes.draw do
  get '/messages/success_flash'           => 'messages#success_flash'
  get '/messages/error_and_warning_flash' => 'messages#error_and_warning_flash'
end
