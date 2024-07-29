# https://github.com/k0kubun/dotfiles/blob/master/recipes/ubuntu/docker/default.rb

package "ca-certificates"

execute "apt-get update" do
  subscribes :run, "remote_file[/etc/apt/sources.list.d/docker.list]"
  action :nothing
end

execute "set keyrings" do
  command 'install -m 0755 -d /etc/apt/keyrings'
  command 'curl -fsSL "https://download.docker.com/linux/ubuntu/gpg" -o /tmp/docker.asc'

  not_if "test -e /etc/apt/keyrings/docker.asc"
end

remote_file "/etc/apt/keyrings/docker.asc" do
  source "/tmp/docker.asc"

  only_if "test -f /tmp/docker.asc"
end

execute "chmod a+r /etc/apt/keyrings/docker.asc" do
  only_if "test -f /etc/apt/keyrings/docker.asc"
end

remote_file "/etc/apt/sources.list.d/docker.list" do
  source "files/jammy_docker.list"

  not_if "test -f /etc/apt/sources.list.d/docker.list"
end

execute "chmod 644 /etc/apt/sources.list.d/docker.list" do
  only_if "test -f /etc/apt/sources.list.d/docker.list"
end

package "docker-ce"
package "docker-ce-cli"
package "containerd.io"
package "docker-buildx-plugin"
package "docker-compose-plugin"

service 'docker' do
  action :enable
end

execute "usermod -aG docker #{node[:user].shellescape}" do
  not_if "groups #{node[:user].shellescape} | grep docker -w"
end
