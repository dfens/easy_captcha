module EasyCaptcha
  module ViewHelpers
    def easy_captcha(text, options = {})
      options = options.reverse_merge(distortion: false, snow: false)      
      captcha = Captcha.create(text, options)
      image   = Base64.encode64(captcha).split.join
      
      image_tag("data:image/png;base64,#{image}")
    end
  end
end
