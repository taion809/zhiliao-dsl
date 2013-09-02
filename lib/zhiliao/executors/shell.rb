require "shellwords"
require "open3"

module Zhiliao
    class Shell
        attr_accessor :command, :arguments, :escape

        def initialize(command, arguments = '', escape = nil)
            @command = command
            @arguments = arguments
            @escape = escape            
        end

        def run
            arguments = @arguments.to_s
            command = @command.to_s

            if !arguments.empty? and !escape.nil?
                command += " " + Shellwords.escape(arguments)
            elsif !arguments.empty?
                command += " " + arguments
            end

            return system command
        end
    end
end