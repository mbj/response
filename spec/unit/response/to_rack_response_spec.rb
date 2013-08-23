require 'spec_helper'

describe Response, '#to_rack_response' do

  subject { object.to_rack_response }

  let(:status)  { Response::Status::OK }
  let(:headers) { double('Headers') }
  let(:body)    { double('Body') }

  context 'with valid response' do
    let(:object) { Response.build(status, headers, body) }

    it { should eql([200, headers, body]) }

    it_should_behave_like 'an idempotent method'
  end

  context 'with invalid response' do
    let(:object) { Response.build }

    it 'should raise error' do
      expect { subject }.to raise_error(Response::InvalidError, "Not a valid response: #{object.inspect}")
    end
  end
end
