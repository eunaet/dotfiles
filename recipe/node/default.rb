# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

execute "install node" do
    command 'curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh" | bash'
    not_if "nvm -v"
end

execute "chown -R #{node[:user].shellescape}:#{node[:user].shellescape} ~/.nvm"
