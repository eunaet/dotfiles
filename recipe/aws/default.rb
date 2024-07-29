# https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html

package 'unzip'

execute 'curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip' do
  not_if "aws --version"
  cwd "/tmp"
end

execute "unzip awscliv2.zip" do
  only_if "test -f /tmp/awscliv2.zip"
  cwd "/tmp"
end

execute "aws/install" do
  only_if "test -d /tmp/aws"
  cwd "/tmp"
end

execute "rm -rf /tmp/aws*" do
  only_if "test -d /tmp/aws"
end
