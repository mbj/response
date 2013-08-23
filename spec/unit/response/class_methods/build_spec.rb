require 'spec_helper'

describe Response, '.build' do
  subject { object.build(&block) }

  let(:object) { described_class }

  context 'without arguments and block' do
    let(:block)   { nil }

    its(:valid?)  { should be(false)               }
    its(:headers) { should eql({})                 }
    its(:status)  { should be(Response::Undefined) }
    its(:body)    { should be(Response::Undefined) }
  end

  context 'with block' do
    let(:yields) { [] }
    let(:value) { double('Value') }
    let(:block) { lambda { |response| yields << response; value } }

    it 'should return value from block' do
      should be(value)
    end

    it 'should call block with response' do
      subject
      yields.should eql([Response.build])
    end
  end
end
