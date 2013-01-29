require 'spec_helper'

describe Response, '#rack_array' do
  subject { object.rack_array }

  let(:status)  { mock('Status')  }
  let(:headers) { mock('Headers') }
  let(:body)    { mock('Body')    }

  let(:object) { described_class.build(status, headers, body) }

  it { should eql([status, headers, body]) }

  it_should_behave_like 'an idempotent method'
end
