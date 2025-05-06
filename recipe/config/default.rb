[
  '.bash_aliases',
].each do |config|
  direcory File.dirname(link_from = File.join(ENV['HOME'],config)) do
    user node[:user]
  end

  link link_from do
    to File.expand_path("../../../config/#{config}",__FILE__)
    user node[:user]
    force true
  end
end