require 'spec_helper'

describe Response, '#content_type' do
  subject { object.content_type }

  let(:object) { Response.build.with_headers(header) }

  context 'when Content-Type header is present' do
    let(:header) { { 'Content-Type' => value } }

    let(:value) { mock('Value') }

    it { should be(value) }

    it_should_behave_like 'an idempotent method'
  end

  context 'when Content-Type header is not present' do
    let(:header) { {} }

    it { should be(nil) }

    it_should_behave_like 'an idempotent method'
  end
end

