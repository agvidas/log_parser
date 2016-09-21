require_relative '../../lib/parser'
describe '.Parser' do
  let(:parser) { Parser.new('./spec/test_logs/webserver.log') }

  let(:ordered_most_visits) do
    [
      ["/about/2", 90],
      ["/contact", 89],
      ["/index", 82],
      ["/about", 81],
      ["/help_page/1", 80],
      ["/home", 78]
    ]
  end

  let(:ordered_unique_visits) do
    [
      ["/help_page/1", 23],
      ["/contact", 23],
      ["/home", 23],
      ["/index", 23],
      ["/about/2", 22],
      ["/about", 21]
    ]
  end

  context '#order_most_visits' do
    it 'should return ordered page visits'do
      parser.read_log_file
      expect(parser.order_most_visits).to eq(ordered_most_visits)
    end
  end

  context '#order_unique_visits' do
    it 'should return ordered unique page views' do
      parser.read_log_file
      expect(parser.order_unique_visits).to eq(ordered_unique_visits)
    end
  end

end
