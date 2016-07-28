require "rubygems"
require 'awesome_print'
AwesomePrint.irb!

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true

unless IRB.version.include?('DietRB')
IRB::Irb.class_eval do
def output_value
ap @context.last_value
end
end
else # MacRuby
IRB.formatter = Class.new(IRB::Formatter) do
def inspect_object(object)
object.ai
end
end.new
end