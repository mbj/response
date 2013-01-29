require 'spec_helper'

describe Response, '#status' do

  subject { object.status }

  context 'when unset' do
    let(:object) { described_class.build }

    it { should be(Response::Undefined) }
  end

  context 'when set' do
    let(:status) { mock('Status') }

    let(:object) { described_class.build.with_status(status) }

    it { should be(status) }

    it_should_behave_like 'an idempotent method'
  end
end
