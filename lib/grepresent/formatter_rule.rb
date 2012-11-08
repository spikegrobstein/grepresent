module Grepresent
  class FormatterRule

    attr_reader :pattern, :format

    def initialize(pattern, format)
      @pattern = Regexp.new(pattern)
      @format = format
    end

    def apply(string)
      string.gsub(pattern) do |m|
        "#{ formats }#{ m }#{ Term::ANSIColor.reset }"
      end
    end

    def formats
      format.split(',').map { |f| Term::ANSIColor.send(f) }.join('')
    end

  end
end
