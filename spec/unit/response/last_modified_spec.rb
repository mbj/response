require 'spec_helper'

describe Response, '#last_modified' do
  subject { object.last_modified }

  let(:object) { Response.build.with_headers(header) }

  let(:time) { Time.httpdate(Time.now.httpdate) }

  context 'when Content-Type header is present' do
    let(:header) { { 'Last-Modified' => time.httpdate } }

    it { should eql(time) }

    it_should_behave_like 'an idempotent method'
  end

  context 'when Content-Type header is not present' do
    let(:header) { {} }

    it { should be(nil) }

    it_should_behave_like 'an idempotent method'
  end
end
