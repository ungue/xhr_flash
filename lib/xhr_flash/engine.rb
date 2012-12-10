module XhrFlash
  class Engine < ::Rails::Engine
    initializer 'xhr-flash'do
      ::ActionController::Base.send :include, ActionController
    end
  end
end
