require Helper

action :create do
  converge_by("Create or overwrite #{new_resource}") do
    create_inifile
    new_resource.updated_by_last_action(true)
  end
end

action :create_if_missing do
  if !exists?
    converge_by("Create #{new_resource} because it does not exist") do
      create_inifile(new_resource.path, new_resource.settings)
      new_resource.updated_by_last_action(true)
    end
  end
end

action :update do
  if exists?
    converge_by("Update #{current_resource} because it already exists") do
      update_inifile(new_resource.path, new_resource.settings) 
      new_resource.updated_by_last_action(true)
    end
  else
    converge_by("Create #{new_resource} because it does not exist") do
      create_inifile(new_resource.path, new_resource.settings)
      new_resource.updated_by_last_action(true)
    end
  end
end

def why_supported?
  true
end

def load_current_resource
  @current_resource = Chef::Resource::IniFile.new(new_resource.name)
  @current_resource.path(new_resource.path)
end

def exists?
  ::File.exists?(new_resource.path)
end
