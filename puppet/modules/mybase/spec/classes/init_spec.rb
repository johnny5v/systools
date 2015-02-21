require 'spec_helper'
describe 'mybase' do

  context 'with defaults for all parameters' do
    it { should contain_class('mybase') }
  end
end
