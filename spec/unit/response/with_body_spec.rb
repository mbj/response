require 'spec_helper'

describe Response, '#with_body' do
  subject { object.with_body(body) }

  let(:object) { described_class.new }
  let(:body) { mock('Body')      }

  its(:body) { should be(body) }

  it_should_behave_like 'a functional command method'
end
