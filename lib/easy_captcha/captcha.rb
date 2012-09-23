require 'chunky_png'

module EasyCaptcha
  module Captcha
    LETTER_WIDTH  = 25
    LETTER_HEIGHT = 50

    def self.add_letter(img, pos, letter_num, distortion)
      letter_file = File.read("#{File.dirname(__FILE__) }/../../assets/letters/#{"%02d" % letter_num}.png")    
      letter      = ChunkyPNG::Image.from_blob(letter_file)

      (0..letter.width-1).each do |i|
        (0..letter.height-1).each do |j|
          distort = distortion ? rand(2) : 0
          
          vertical_position   = i + pos * LETTER_WIDTH
          horizontal_position = j + (img.height - letter.height) / 2 + distort
          
          img[vertical_position, horizontal_position] = letter[i, j]
        end
      end
    end

    def self.create(text, options)
      raise "Invalid EasyCaptcha text input" unless text =~ /^[a-zA-Z]+$/

      text  = text.downcase
      width = text.length * LETTER_WIDTH
      png   = ChunkyPNG::Image.new(width, LETTER_HEIGHT, ChunkyPNG::Color::TRANSPARENT)

      # Add chars
      text.chars.each_with_index do |c, i|
        add_letter(png, i, c.ord - 'a'.ord, options[:distortion])
      end

      if options[:snow]
        (Math.sqrt(width * LETTER_HEIGHT)).to_i.times do
          vertical_position   = rand(width)
          horizontal_position = rand(LETTER_HEIGHT)
          
          png[vertical_position, horizontal_position] = ChunkyPNG::Color.rgb(0,0,0)
        end
      end

      png.to_blob
    end
  end
end
