describe '計算' do
	context '12 + 6の場合' do
		it '18 になること' do
			expect(12 + 6).to eq 18
		end
		it '20にはならない' do
			expect(12 + 6).not_to eq 20
		end
	end

	context '6 × 4の場合' do
		it '24になること' do
			expect(6 * 4).to eq 24
		end
		it '30にはならない' do
			expect(6 * 4).not_to eq 30
		end
	end
	context '100 ÷ 20の場合' do
		it '5になること' do
			expect(100 / 20).to eq 5
		end
		it '6にはならない' do
			expect(100 / 20).not_to eq 6
		end
	end
end