require_relative 'log_entry'

class Parser
  attr_accessor :most_visits, :unique_visits
  attr_reader :log_path, :log_entries

  def initialize(log_path)
    @log_path, @log_entries, @most_visits, @unique_visits = log_path, [], [], []
  end

  def read_log_file
    File.read(log_path).each_line do |line|
      create_log_entry(line)
    end
  end

  def order_most_visits
    unique_urls.each do |url|
      most_visits << ([url, amount_of_visits(url).size])
    end
    sort_out(most_visits)
  end

  def order_unique_visits
    unique_urls.each do |url|
      unique_visits << ([url, amount_of_unique_visits(url)])
    end
    sort_out(unique_visits)
  end

  private

  def create_log_entry(line)
    url, ip_address = line.split
    log_entries << LogEntry.new(url: url, ip_address: ip_address)
  end

  def unique_urls
    log_entries.map(&:url).uniq
  end

  def amount_of_visits(url)
    log_entries.select { |entry| entry.url == url }
  end

  def amount_of_unique_visits(url)
    amount_of_visits(url).map(&:ip_address).uniq.size
  end

  def sort_out(visits)
    visits.sort { |a, b| b.last <=> a.last }
  end

end
