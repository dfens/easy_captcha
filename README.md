# EasyCaptcha

EasyCaptcha is lightweight gem providing possibility to generate captcha image to your website. If you can't use imagemagick or use external services like recaptcha see this gem.

## Installation

Just add dependency to your gemfile:

    gem 'easy_captcha', :git => "git@github.com:dfens/easy_captcha.git"

## Usage

In your view just use `easy_captcha` method:

    <%= easy_captcha("ASDF") %>

There are also additional options: `distortion` and `snow`.
See this example:

    <%= easy_captcha("ASDF") %>
    <br/>
    <%= easy_captcha("JTGIAEJOFA", {:snow => true}) %>
    <br/>
    <%= easy_captcha("ASFAIEJRFO", {:distortion => true}) %>
    <br/>
    <%= easy_captcha("JGII", {:distortion => true, :snow => true}) %>
    
Result:

[<img src="http://img109.imageshack.us/img109/1092/captchafp.png">]

## Minimalism
Currently you can't change fonts and add another effects. Also this is just logic-less gem. To verify captcha you should implement your own logic.


This project rocks and uses MIT-LICENSE.
