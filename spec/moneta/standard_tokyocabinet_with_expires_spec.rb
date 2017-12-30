describe 'standard_tokyocabinet_with_expires' do
  moneta_store :TokyoCabinet do
    {file: File.join(tempdir, "simple_tokyocabinet_with_expires"), expires: true}
  end

  moneta_specs STANDARD_SPECS.without_multiprocess.with_expires
end
