require 'bundler/gem_tasks'
require 'fileutils'

desc 'Update the Bootstrap-slider Javascript and CSS files'
task :update_slider do
  def download_slider(version)
    base_url = 'https://raw.githubusercontent.com/seiyria/bootstrap-slider'
    puts "Downlading Bootstrap-slider #{version} ..."
    `curl -o vendor/assets/javascripts/bootstrap-slider.min.js \
      #{base_url}/v#{version}/dist/bootstrap-slider.min.js`
    `curl -o vendor/assets/stylesheets/bootstrap-slider.css \
      #{base_url}/v#{version}/dist/css/bootstrap-slider.css`
  end

  FileUtils.mkdir_p('vendor/assets/javascripts')
  FileUtils.mkdir_p('vendor/assets/stylesheets')
  download_slider(BootstrapSlider::Rails::BOOTSTRAP_SLIDER_VERSION)
  puts "\e[32mDone!\e[0m"
end
