Vagrant::Config.run do |config|
  config.vm.box = "lucid64"
  config.vm.forward_port('http', 4000, 4000)
  config.vm.share_folder('v-jekyll', '/jekyll', 'jekyll')
  config.vm.provision :puppet, :module_path => 'modules'
end
