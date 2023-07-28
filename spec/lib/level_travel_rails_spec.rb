# frozen_string_literal: true

describe LevelTravelRails do
  it 'is possible to provide config options' do
    described_class.config do |c|
      expect(c).to eq(described_class)
    end
  end

  describe 'parameters' do
    let(:fake_class) { class_double('LevelTravelRails') }

    it 'is possible to set_api_token' do
      expect(fake_class).to receive(:api_token=).with('secret_token')
      fake_class.api_token = 'secret_token'
    end

    it 'is possible to set_error_paths' do
      expect(fake_class).to receive(:error_load_path=).with('some_paths')
      fake_class.error_load_path = 'some_paths'
    end

    it 'is possible to set default timeout' do
      expect(fake_class).to receive(:timeout=).with(10)
      fake_class.timeout = 10
    end
  end

  describe 'version' do
    it 'has a version number' do
      expect(LevelTravelRails::VERSION).not_to be_nil
    end
  end
end