require 'puppet'

Puppet::Reports.register_report(:kvlog) do

  desc <<-DESC
  Send metrics in key=value format to syslog.
  DESC

  def process
    Puppet.debug "Sending metrics for #{self.host} to syslog."

    message = "node=#{self.host}"
    message << ", configuration_version=#{self.configuration_version}"
    message << ", status=#{self.status}"
    message << ", kind=#{self.kind}"
    message << ", environment=#{self.environment}"
    if ! self.metrics.empty?
      message << ", report=metrics"
      self.metrics.each { |metric,data|
        data.values.each { |val|
          if metric == 'time'
            units = 'seconds'
          else
            units = metric
          end
          key = "#{val[0]}_#{units}"
          value = val[2]
          # wrap string values with whitespace in quotes
          if (value.respond_to?(:index) && value.index(/\s/))
              value = "\"#{value}\""
          end
          message << ", #{key}=#{value}"
        }
      }
      Puppet::Util::Log.create(:level => :notice, :message => message)
    end
  end
end
