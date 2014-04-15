#
# Cookbook name: ganglia
# Recipe:: server
include_recipe 'chef-httpd::basic'

node['ganglia']['server']['packages'].each do |gangliapkgs|
    package gangliapkgs
end

service "gmond" do
    action [:start, :enable]
end

service "gmetad" do
    action [:start, :enable]
end

template "/etc/ganglia/gmetad.conf" do
    source "gmetad.conf.erb"
    mode "0644"
    owner "root"
    group "root"
    notifies :restart, "service[gmetad]", :immediately
end

template "/etc/ganglia/gmond.conf " do
    source "gmond.conf.server.erb"
    mode "0644"
    owner "root"
    group "root"
    notifies :restart, "service[gmond]", :immediately
end

template "/etc/httpd/conf.d/ganglia.conf" do
    source "ganglia.conf.erb"
    mode "0644"
    owner "root"
    group "root"
    notifies :restart, "service[httpd]", :immediately
end