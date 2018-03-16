describe 'adapter_leveldb' do
  moneta_build do
    Moneta::Adapters::LevelDB.new(dir: File.join(tempdir, "adapter_leveldb"))
  end

  moneta_specs ADAPTER_SPECS.with_each_key.without_multiprocess
end
