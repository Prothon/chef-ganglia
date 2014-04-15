default['ganglia']['server']['packages'] = %w(ganglia ganglia-gmetad ganglia-web ganglia-gmond)
default['ganglia']['server']['cluster'] = "lab"
default['ganglia']['server']['subnet'] = "10.13.37"
default['ganglia']['client']['packages'] = %w(ganglia ganglia-gmond)