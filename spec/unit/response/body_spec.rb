require 'spec_helper'

describe Response, '#body' do

  subject { object.body }

  context 'when unset' do
    let(:object) { described_class.build }

    it { should be(Response::Undefined) }
  end

  context 'when set' do
    let(:body) { mock('Body') }

    let(:object) { described_class.build.with_body(body) }

    it { should be(body) }

    it_should_behave_like 'an idempotent method'
  end
end
