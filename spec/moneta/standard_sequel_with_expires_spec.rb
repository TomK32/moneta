describe 'standard_sequel_with_expires' do
  let(:t_res){ 0.1 }
  let(:min_ttl){ t_res }

  moneta_store :Sequel, {db: if defined?(JRUBY_VERSION)
                                   "jdbc:mysql://localhost/moneta?user=root"
                                 else
                                   "mysql2://root:@localhost/moneta"
                                 end,
                             table: "simple_sequel_with_expires",
                             expires: true}

  moneta_specs STANDARD_SPECS.with_expires
end
