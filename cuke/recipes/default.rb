
%w[x11-xkb-utils xfonts-base xfonts-encodings xfonts-utils xserver-common xvfb].each do |packages|
  package packages
end

package "firefox" do
	action :install
end

directory node.xvfb.pid.dir do
  owner node.xvfb.user
  group node.xvfb.group
  mode "0755"
end

template "/etc/init.d/Xvfb" do
  source  "xvfb.erb"
  owner   "root"
  group   "root"
  mode    0755
end

service "Xvfb" do
  action :restart
end

