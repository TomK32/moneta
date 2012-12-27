# Generated by generate.rb
require 'helper'

describe_moneta "expires_file" do
  def new_store
    Moneta.build do
      use :Expires
      use :Transformer, :key => [:marshal, :escape], :value => :marshal
      adapter :File, :dir => File.join(make_tempdir, "expires-file")
    end
  end

  def load_value(value)
    Marshal.load(value)
  end

  include_context 'setup_store'
  it_should_behave_like 'expires'
  it_should_behave_like 'increment'
  it_should_behave_like 'marshallable_key'
  it_should_behave_like 'marshallable_value'
  it_should_behave_like 'null_objectkey_stringvalue'
  it_should_behave_like 'null_stringkey_stringvalue'
  it_should_behave_like 'null_hashkey_stringvalue'
  it_should_behave_like 'null_booleankey_stringvalue'
  it_should_behave_like 'null_nilkey_stringvalue'
  it_should_behave_like 'null_integerkey_stringvalue'
  it_should_behave_like 'persist_objectkey_stringvalue'
  it_should_behave_like 'persist_stringkey_stringvalue'
  it_should_behave_like 'persist_hashkey_stringvalue'
  it_should_behave_like 'persist_booleankey_stringvalue'
  it_should_behave_like 'persist_nilkey_stringvalue'
  it_should_behave_like 'persist_integerkey_stringvalue'
  it_should_behave_like 'returndifferent_objectkey_stringvalue'
  it_should_behave_like 'returndifferent_stringkey_stringvalue'
  it_should_behave_like 'returndifferent_hashkey_stringvalue'
  it_should_behave_like 'returndifferent_booleankey_stringvalue'
  it_should_behave_like 'returndifferent_nilkey_stringvalue'
  it_should_behave_like 'returndifferent_integerkey_stringvalue'
  it_should_behave_like 'store_objectkey_stringvalue'
  it_should_behave_like 'store_stringkey_stringvalue'
  it_should_behave_like 'store_hashkey_stringvalue'
  it_should_behave_like 'store_booleankey_stringvalue'
  it_should_behave_like 'store_nilkey_stringvalue'
  it_should_behave_like 'store_integerkey_stringvalue'
  it_should_behave_like 'transform_value_with_expires'
  it 'deletes expired value in underlying file storage' do
    store.store('foo', 'bar', :expires => 2)
    store['foo'].should == 'bar'
    sleep 1
    store['foo'].should == 'bar'
    sleep 2
    store['foo'].should be_nil
    store.adapter['foo'].should be_nil
    store.adapter.adapter['foo'].should be_nil
  end

end
