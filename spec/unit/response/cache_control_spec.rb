require 'spec_helper'

describe Response, '#cache_control' do
  subject { object.cache_control }

  let(:object) { Response.build.with_headers(header) }

  context 'when Cache-Control header is present' do
    let(:header) { { 'Cache-Control' => value } }

    let(:value) { mock('Value') }

    it { should be(value) }

    it_should_behave_like 'an idempotent method'
  end

  context 'when Cache-Control header is not present' do
    let(:header) { {} }

    it { should be(nil) }

    it_should_behave_like 'an idempotent method'
  end
end
