# encoding: utf-8

shared_examples_for 'a functional command method' do
  it 'returns object of described_class' do
    should be_kind_of(described_class)
  end

  it 'should return a new object' do
    should_not be(object)
  end
end
