require_relative 'enigma'
require_relative 'constants'
require 'optionparser'
require 'pp'

options = {}
input_text = ''
optparse = OptionParser.new do |opts|
  opts.banner = 'Usage: run.rb [options]'

  opts.on('-m TEXT', '--message TEXT',
          'Text to cipher or decipher') do |text|
    input_text = text
  end

  opts.on('--reflector [REFLECTOR]',
          'A, B, C, B\ Thin, C\ Thin',
          'defaults to B') do |reflector|
    options[:reflector] = reflector
  end

  opts.on('-r [x,y,z]', '--rotors [x,y,z]', Array,
          'I, II, III, IV, V, VI, VII, VIII, Beta, Gamma',
          'defaults to I,II,III') do |rotors|
    options[:rotors] = rotors unless rotors.length != 3
  end

  opts.on('-s [x,y,z]', '--settings [x,y,z]', Array,
          'Letters A-Z, defaults to A,A,A') do |settings|
    options[:settings] = settings unless settings.length != 3
  end

  opts.on('-h', '--help') do
    puts opts.help
    exit
  end
end

optparse.parse!

# p options
# p ARGV

enigma = Enigma.new(options)
puts enigma.run(input_text)
