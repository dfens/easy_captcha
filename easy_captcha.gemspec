$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "easy_captcha/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "easy_captcha"
  s.version     = EasyCaptcha::VERSION
  s.authors     = ["Paweł Mikołajewski"]
  s.email       = ["mikolajewskip@gmail.com"]
  s.homepage    = "http://github.com/dfens/easy_captcha"
  s.summary     = "Create dynamic captcha without any external libraries"
  s.description = "Create dynamic captcha without any external libraries"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency "chunky_png"
end
