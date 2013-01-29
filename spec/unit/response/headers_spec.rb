require 'spec_helper'

describe Response, '#headers' do

  subject { object.headers }

  context 'when unset' do
    let(:object) { described_class.build }

    it { should eql({}) }
  end

  context 'when set' do
    let(:headers) { mock('Headers') }

    let(:object) { described_class.build.with_headers(headers) }

    it { should be(headers) }

    it_should_behave_like 'an idempotent method'
  end

end
