module Zhiliao
    def self.build(name, &block)
        job = Job.new(name)
        job.instance_eval(&block)
        return job
    end
end