describe 'data_correlation' do
  subject(:increase_rate) { global_increase_price_rate(data) }

  context 'when the there are 2 variants for each request ids' do
    let(:data) {
      %Q(
I, [2023-03-18T19:22:00.152079 #642]  INFO -- : Request_ID:1485, Variant_A: 45€
I, [2023-03-18T19:22:00.152084 #643]  INFO -- : Request_ID:1486, Variant_A: 71€
I, [2023-03-18T19:22:00.152114 #644]  INFO -- : Request_ID:1485, Variant_B: 47€
I, [2023-03-18T19:22:00.152148 #645]  INFO -- : Request_ID:1486, Variant_B: 84€
      )
    }
    it 'correlate and provide the increase rate' do
      expect(increase_rate).to eq(12.93)
    end
  end
end
