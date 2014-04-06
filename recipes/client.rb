#
# Cookbook name: ganglia
# Recipe:: client

node['ganglia']['client']['packages'].each do |gangliapkgs|
    package gangliapkgs
end

service "gmond" do
    action [:start, :enable]
end

template "/etc/ganglia/gmond.conf " do
    source "gmond.conf.client.erb"
    mode "0644"
    owner "root"
    group "root"
    notifies :restart, "service[gmond]", :immediately
end