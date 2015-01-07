namespace :load do
  task :defaults do
    set :god_roles, -> { [:app,:web] }
    set :god_deploy_dir, -> { "#{release_path}/config/god/deploy/" }
  end
end
namespace :god do
  task :deploy do
    require "erb"
    fetch(:god_roles).each do |role|
      on roles(role) do
        within release_path do 
          @rails_env = fetch(:rails_env)
          @god_variables = fetch(:god_variables)

          deploy_dir = fetch(:god_deploy_dir)
          execute :mkdir, "-p #{deploy_dir}"
          god_files_path = "config/god/#{role}/"
          erb_templates = Dir.glob(god_files_path  + "*.erb")
          erb_templates.each do |template|
            compiled_template = StringIO.new(ERB.new(File.open(template).read).result(binding))
            upload! compiled_template, "#{deploy_dir}#{template.gsub(".erb","").split("/").last}"
          end
          templates = Dir.glob(god_files_path + "*.god")
          templates.each do |template|
            upload! File.open(template,'r'), "#{deploy_dir}#{template.split("/").last}"
          end
        end
      end
    end
  end
end

