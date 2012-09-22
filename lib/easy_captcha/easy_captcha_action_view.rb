module EasyCaptcha

  module Helpers

    def easy_captcha(text, options = { :distortion => false, :snow => false })
      captcha = Captcha.create(text, options)
      image_tag("data:image/png;base64,#{Base64.encode64(captcha).split.join}")
    end

  end

end

ActionView::Base.module_eval do
  include EasyCaptcha::Helpers
end
