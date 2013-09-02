module Zhiliao
    class Sequence
        attr_accessor :name, :build_steps
        def initialize(name = '')
            @name = name.to_s
            @build_steps = []
        end

        def shell(name, arguments = '', escape = nil)
            s = Shell.new(name, arguments, escape)
            @build_steps << s
        end

        def run
            @build_steps.each do |b|
                b.run
            end
        end
    end
end