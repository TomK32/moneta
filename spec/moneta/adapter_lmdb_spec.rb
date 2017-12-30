describe 'adapter_lmdb' do
  moneta_build do
    Moneta::Adapters::LMDB.new(dir: File.join(tempdir, "adapter_lmdb"))
  end

  moneta_specs ADAPTER_SPECS.without_concurrent
end
