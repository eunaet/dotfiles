# Ruby build dependencies
package 'libffi-dev'
package 'libreadline-dev'
package 'libssl-dev'
package 'autoconf'
package 'patch'
package 'build-essential'
package 'rustc'
package 'libyaml-dev'
package 'libreadline6-dev'
package 'zlib1g-dev'
package 'libgmp-dev'
package 'libncurses5-dev'
package 'libgdbm6'
package 'libgdbm-dev'
package 'libdb-dev'
package 'uuid-dev'

execute "curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash" do
  command 'echo \'eval "$(~/.rbenv/bin/rbenv init - bash)"\' >> ~/.bashrc'

  not_if "rbenv version"
end
