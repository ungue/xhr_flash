module XhrFlash
  module ActionController
    extend ActiveSupport::Concern

    included do
      after_filter :add_custom_headers_from_flash
    end

    ## Private methods
    private

    def add_custom_headers_from_flash
      return unless request.xhr?
      flash.each { |type, message| response.headers["X-Flash-#{type.to_s.titleize}"] = message }
      flash.discard
    end
  end
end
