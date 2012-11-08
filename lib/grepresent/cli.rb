require 'optparse'

module Grepresent
  class CLI

    attr_reader :rules

    def self.run!
      # options = []
      # options << Option.new(:name => [ '-h', '--help' ],
                            # :)
      @rules = []

      OptionParser.new do |opts|
        opts.banner = "Usage: grepresent [ options ]"

        # opts << Option.new(:name => [ '-f', '--format PATTERN FORMAT', [1,1] ],
                            # :arg_arity => [2,2])
        opts.on("-f", "--format PATTERN FORMAT", String, String, "Specify a format") do |p|
          f = ARGV.shift
          @rules << Grepresent::FormatterRule.new(p, f)
        end

        opts.on("-h", "--help") do
          puts opts
          exit
        end
      end.parse!

    end

    def self.start
      $stdin.each do |line|
        @rules.each { |r| line = r.apply(line) }
        puts line
      end
    end

  end
end

Grepresent::CLI.run!
