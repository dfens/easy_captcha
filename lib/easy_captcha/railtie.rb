require 'easy_captcha/view_helpers'

module EasyCaptcha
  class Railtie < Rails::Railtie
    initializer 'easy_captcha.view_helpers' do |app|
      ActiveSupport.on_load :action_view do
        include EasyCaptcha::ViewHelpers
      end
    end
  end
end