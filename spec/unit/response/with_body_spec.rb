require 'spec_helper'

describe Response, '#with_body' do
  subject { object.with_status(status).with_headers(headers).with_body(body) }

  let(:object)  { described_class.build }

  let(:status)  { Response::Status::OK }
  let(:body)    { mock('Body')         }
  let(:headers) { mock('Headers')      }
                                      
  its(:status)  { should be(status)    }
  its(:body)    { should be(body)      }
  its(:headers) { should be(headers)   }

  it_should_behave_like 'a functional command method'
end
