require 'computer'

describe Computer do
  subject(:computer_player) { Computer.new('O') }

  describe 'Computer marker and type' do
    it 'should have O marker for the Computer' do
      expect(computer_player.marker).to eq('O')
    end

    it 'should have correct type for the Computer player' do
      expect(computer_player.type).to eq('Computer')
    end
  end
end
