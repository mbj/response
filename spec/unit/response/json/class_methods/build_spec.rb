require 'spec_helper'

describe Response::JSON, '.build' do
  subject { object.build(body) }

  let(:body)   { double('Body')    }
  let(:object) { described_class }

  its(:status)  { should be(Response::Status::OK)                                 }
  its(:body)    { should be(body)                                                 }
  its(:headers) { should eql('Content-Type' => 'application/json; charset=UTF-8') }

  it 'allows to modify response' do
    object.build(body) do |response|
      response.with_status(404)
    end.status.should be(404)
  end
end
