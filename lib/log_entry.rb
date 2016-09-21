class LogEntry
  attr_reader :url, :ip_address

  def initialize(url:, ip_address:)
    @url, @ip_address = url , ip_address
  end
end
