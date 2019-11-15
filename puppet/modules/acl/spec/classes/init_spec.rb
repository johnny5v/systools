require 'spec_helper'
describe 'acl' do
  context 'with default values for all parameters' do
    it { should contain_class('acl') }
  end
end
