require 'puppet'
require 'yaml'

Puppet::Reports.register_report(:kvlog) do

  desc <<-DESC
  Send metrics in key=value format to syslog.
  DESC

  def process
    Puppet.debug "Sending metrics for #{self.host} to syslog."
    log = Puppet::Util::Log.create(:level => :info, :message => "", :source => self.host)

    self.metrics.each { |metric,data|
      data.values.each { |val|
        if metric == 'time'
          units = 'seconds'
        else
          units = metric
        end
        key = "#{val[0].downcase}_#{units}"
        value = val[2]
        log.message << ", #{key}=\"#{value}\""
      }
    }
    Puppet::Util::Log.newmessage(log)
  end
end
