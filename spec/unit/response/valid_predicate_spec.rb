require 'spec_helper'

describe Response, '#valid?' do
  subject { object.valid? }

  context 'with status and body' do
    let(:object) { described_class.build(mock('Status'), {}, mock('Body')) }

    it { should be(true) }

    it_should_behave_like 'an idempotent method'
  end

  context 'without body' do
    let(:object) { described_class.build.with_status(mock('Status')) }

    it { should be(false) }

    it_should_behave_like 'an idempotent method'
  end

  context 'without status' do
    let(:object) { described_class.build.with_body(mock('Body')) }

    it { should be(false) }

    it_should_behave_like 'an idempotent method'
  end

  context 'without status and body' do
    let(:object) { described_class.build }

    it { should be(false) }

    it_should_behave_like 'an idempotent method'
  end
end
