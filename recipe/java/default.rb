# https://docs.aws.amazon.com/corretto/latest/corretto-17-ug/generic-linux-install.html

package "java-common"

execute "curl -LO https://corretto.aws/downloads/latest/amazon-corretto-17-x64-linux-jdk.deb" do
  not_if "java --version | grep Corretto-17"
  cwd "/tmp"
end

execute "dpkg --install amazon-corretto-17-x64-linux-jdk.deb" do
  only_if "test -f amazon-corretto-17-x64-linux-jdk.deb"
  cwd "/tmp"
end
