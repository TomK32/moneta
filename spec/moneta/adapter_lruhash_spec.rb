# Generated by generate.rb
require 'helper'

describe_moneta "adapter_lruhash" do
  def new_store
    Moneta::Adapters::LRUHash.new
  end

  def load_value(value)
    Marshal.load(value)
  end

  include_context 'setup_store'
  it_should_behave_like 'increment'
  it_should_behave_like 'not_persist'
  it_should_behave_like 'null_stringkey_stringvalue'
  it_should_behave_like 'returndifferent_stringkey_stringvalue'
  it_should_behave_like 'store_stringkey_stringvalue'
  it 'deletes oldest' do
    store = Moneta::Adapters::LRUHash.new(:max_size => 10)
    store[0]  = 'y'
    (1..1000).each do |i|
      store[i] = 'x'
      store[0].should == 'y'
      store.instance_variable_get(:@entry).size.should == [10, i+1].min
      (0...[9, i-1].min).each do |j|
        store.instance_variable_get(:@entry)[i-j].should_not be_nil
      end
      store.key?(i-9).should be_false if i > 9
    end
  end
end
