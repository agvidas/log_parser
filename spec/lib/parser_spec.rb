describe '.Parser' do
  let(:parser) { Parser.new('./webserver.log') }
  let(:ordered_most_visits) { [['url', 'ip'] ] }
  let(:ordered_unique_visits) { [['url', 'ip'] ] }

  context '#order_most_visits' do
    it 'should return ordered page visits'do
      expect(parser.order_most_visits).to eq(ordered_most_visits)
    end
  end

  context '#order_unique_visits' do
    it 'should return ordered unique page views' do
      expect(parser.order_unique_visits).to eq(ordered_unique_visits)
    end
  end

end
