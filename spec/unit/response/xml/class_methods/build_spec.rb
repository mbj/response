require 'spec_helper'

describe Response::XML, '.build' do
  subject { object.build(body) }

  let(:body) { mock('Body') }

  let(:object)  { described_class }
                
  its(:status)  { should be(200) }
  its(:body)    { should be(body) }
  its(:headers) { should eql('Content-Type' => 'application/xml; charset=UTF-8') }
end
