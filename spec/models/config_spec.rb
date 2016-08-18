require 'rails_helper'

describe Config do
  describe 'when created' do
    before(:each) do ; @p = create(:project) ; end
    it 'marshals to an empty hash' do
      config = create(:project).configs.build(:metric_name => 'xyz')
      expect(config.options).to eq({})
    end
    it 'retrieves the empty hash' do
      proj = create(:project)
      proj.configs.create!(:metric_name => 'xyz')
      expect(proj.reload.configs.first.options).to eq({})
    end
    it 'saves config options as hash' do
      hsh = {'key' => 'foo', 'bar' => 2}
      @p.configs.create!(:metric_name => 'xyz', :options => hsh)
      expect(@p.reload.configs.first.options).to eq hsh
    end
  end
end

