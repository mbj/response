require 'spec_helper'

describe Response, '.build' do
  subject { object.build(&block) }

  let(:object) { described_class }

  context 'without block' do
    let(:block) { nil }

    it 'should return response' do
      should eql(Response.new)
    end
  end

  context 'with block' do
    let(:yields) { [] }
    let(:value) { mock('Value') }
    let(:block) { lambda { |response| yields << response; value } }

    it 'should return value from block' do
      should be(value)
    end

    it 'should call block with response' do
      subject
      yields.should eql([Response.new])
    end
  end
end
