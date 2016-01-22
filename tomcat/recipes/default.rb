execute "install_updates" do
    command "apt-get update"
end

package "tomcat7" do
    action :install
end

include_recipe 'tomcat::service'

service 'tomcat' do
    action :enable
end

directory "/srv/www/shared" do
    mode 0755
    owner 'root'
    recursive true
    action :create
end

template "/srv/www/shared/example_data.json" do
    source "example_data.json.erb"
    mode 0644
    variables(
	:a_boolean_var => true,
	:a_string_var => "some string"
    )
    only_if {node['createfile']['install_file']}
    notifies :restart, resources(:service => 'tomcat')
end
