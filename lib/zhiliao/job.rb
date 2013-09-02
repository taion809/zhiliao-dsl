module Zhiliao
    class Job
        attr_accessor :name, :build_steps
        def initialize(name = '')
            @name = name.to_s
            @build_steps = {}
        end

        def sequence(number, &block)
            n = Sequence.new(number)
            n.instance_eval(&block)
            @build_steps = @build_steps.merge({ number => n })
        end

        def run
            result = @build_steps[:before].run
            result = @build_steps[:build].run
            result = @build_steps[:after].run
        end
    end
end