require 'rails_helper'

describe Config do
  describe 'when created' do
    it 'marshals to an empty hash' do
      c = create(:project).configs.build(:metric_name => 'xyz')
      c.options.should == {}
    end
  end
end

