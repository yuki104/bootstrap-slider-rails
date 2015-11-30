require 'bundler/gem_tasks'
require 'fileutils'

desc 'Update the Bootstrap-slider Javascript and CSS files'
task :update do
  def download(version)
    base_url = 'https://raw.githubusercontent.com/seiyria/bootstrap-slider'
    puts "Downlading Bootstrap-slider #{version} ..."
    `curl -o vendor/assets/javascripts/bootstrap-slider.js \
      #{base_url}/v#{version}/js/bootstrap-slider.js`
    `curl -o vendor/assets/stylesheets/bootstrap-slider.css \
      #{base_url}/v#{version}/dist/css/bootstrap-slider.css`
  end

  FileUtils.mkdir_p('vendor/assets/javascripts')
  FileUtils.mkdir_p('vendor/assets/stylesheets')
  download(BootstrapSlider::Rails::VERSION)
  puts "\e[32mDone!\e[0m"
end
