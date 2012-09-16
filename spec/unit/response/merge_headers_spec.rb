require 'spec_helper'

describe Response, '#merge_headers' do
  subject { object.merge_headers(headers) }

  let(:object)  { described_class.new(*arguments) }
  let(:status)  { mock('Status')                  }
  let(:headers) { { 'Baz' => 'Zot' }              }

  context 'when headers where present' do
    let(:arguments) { [status, original_headers] }

    let(:original_headers) { { 'Foo' => 'Bar' } }

    its(:headers) { should eql('Foo' => 'Bar', 'Baz' => 'Zot') }

    it_should_behave_like 'a functional command method'
  end

  context 'when headers where undefined' do
    let(:arguments) { [status] }


    its(:headers) { should eql('Baz' => 'Zot') }

    it_should_behave_like 'a functional command method'
  end
end

