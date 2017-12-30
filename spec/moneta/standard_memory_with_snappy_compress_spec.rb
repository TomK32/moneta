describe 'standard_memory_with_snappy_compress' do
  moneta_store :Memory, {compress: :snappy}

  moneta_loader do |value|
    Marshal.load(::Snappy.inflate(value))
  end
  
  moneta_specs STANDARD_SPECS.without_persist
end
