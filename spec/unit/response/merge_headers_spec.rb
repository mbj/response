require 'spec_helper'

describe Response, '#merge_headers' do
  subject { object.merge_headers(update_headers) }

  let(:object)           { described_class.build(status, original_headers, body)  }
  let(:status)           { Response::Status::OK }
  let(:update_headers)   { { 'Baz' => 'Zot' }   }
  let(:original_headers) { { 'Foo' => 'Bar' }   }

  let(:status)  { mock('Status')    }
  let(:body)    { mock('Body')      }

  its(:status)  { should be(status) }
  its(:body)    { should be(body)   }
  its(:headers) { should eql('Foo' => 'Bar', 'Baz' => 'Zot') }

  it_should_behave_like 'a functional command method'
end

