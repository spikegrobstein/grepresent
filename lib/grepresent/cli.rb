require 'optparse'

module Grepresent
  class CLI

    attr_reader :rules
    attr_reader :debug_mode

    def self.run!
      @dry_run = false
      @rules = []

      OptionParser.new do |opts|
        opts.banner = "Usage: grepresent [ options ]"

        # opts << Option.new(:name => [ '-f', '--format PATTERN FORMAT', [1,1] ],
                            # :arg_arity => [2,2])
        opts.on("-f", "--format PATTERN FORMAT", "Specify a format") do |p|
          f = ARGV.shift
          @rules << Grepresent::FormatterRule.new(p, f)
        end

        opts.on('-d', '--dry-run', "Output all parsed rules, but don't process any input") do
          @dry_run = true
        end

        opts.on("-h", "--help") do
          puts opts
          exit
        end
      end.parse!

    end

    def self.start
      if @dry_run
        @rules.each do |r|
          puts "#{ r.pattern.inspect } => #{ r.format } (#{ r.formats }SAMPLE#{ Term::ANSIColor.reset })"
        end

        return
      end

      $stdin.each do |line|
        @rules.each { |r| line = r.apply(line) }
        puts line
      end
    end

  end
end

Grepresent::CLI.run!
