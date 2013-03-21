require 'spec_helper'

describe Response::Text, '.build' do
  subject { object.build(body) }

  let(:body)    { mock('Body')    }
  let(:object)  { described_class }

  its(:status)  { should be(Response::Status::OK)  }
  its(:body)    { should be(body) }
  its(:headers) { should eql('Content-Type' => 'text/plain; charset=UTF-8') }

  it 'allows to modify response' do
    object.build(body) do |response|
      response.with_status(Response::Status::NOT_FOUND)
    end.status.should be(Response::Status::NOT_FOUND)
  end
end
