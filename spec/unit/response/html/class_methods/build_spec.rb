require 'spec_helper'

describe Response::HTML, '.build' do
  subject { object.build(body) }

  let(:body)    { mock('Body')    }
  let(:object)  { described_class }

  its(:status)  { should be(200)  }
  its(:body)    { should be(body) }
  its(:headers) { should eql('Content-Type' => 'text/html; charset=UTF-8') }

  it 'allows to modify response' do
    object.build(body) do |response|
      response.with_status(404)
    end.status.should be(404)
  end
end
