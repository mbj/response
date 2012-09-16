require 'spec_helper'

describe Response, '#with_headers' do
  subject { object.with_headers(headers) }

  let(:object) { described_class.new }
  let(:headers) { mock('Headers')      }

  its(:headers) { should be(headers) }

  it_should_behave_like 'a functional command method'
end
