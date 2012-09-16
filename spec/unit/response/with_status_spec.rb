require 'spec_helper'

describe Response, '#with_status' do
  subject { object.with_status(status) }

  let(:object) { described_class.new }
  let(:status) { mock('Status')      }

  its(:status) { should be(status) }

  it_should_behave_like 'a functional command method'
end
