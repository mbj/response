require 'spec_helper'

describe Response, '#rack_array' do
  subject { object.rack_array }

  let(:status)  { Response::Status::OK  }
  let(:headers) { double('Headers') }
  let(:body)    { double('Body')    }

  let(:object) { described_class.build(status, headers, body) }

  it { should eql([200, headers, body]) }

  it_should_behave_like 'an idempotent method'
end
