require 'chunky_png'

module EasyCaptcha

  module Captcha

    LETTER_WIDTH  = 25
    LETTER_HEIGHT = 50

    def self.add_letter(img, pos, letter_num, distortion)
      letter = ChunkyPNG::Image.from_blob(File.read("#{File.dirname(__FILE__) }/../../assets/letters/#{"%02d" % letter_num}.png"))
      for i in 0..letter.width-1
        for j in 0..letter.height-1
          distort = distortion ? rand(2) : 0
          img[ i + pos * LETTER_WIDTH , j + (img.height-letter.height) / 2 + distort] = letter[i,j]
        end
      end
    end

    def self.create(text, options)
      raise "Invalid EasyCaptcha text input" unless text =~ /^[a-zA-Z]+$/

      text.downcase!
      width = text.length * LETTER_WIDTH

      png = ChunkyPNG::Image.new(width, LETTER_HEIGHT, ChunkyPNG::Color::TRANSPARENT)

      # Add chars
      text.chars.each_with_index { |c, i| add_letter(png, i, c.ord - 'a'.ord, options[:distortion])}

      if options[:snow]
        (Math.sqrt(width * LETTER_HEIGHT)).to_i.times do
          png[rand(width), rand(LETTER_HEIGHT)] = ChunkyPNG::Color.rgb(0,0,0)
        end
      end

      png.to_blob
    end
  end
end
