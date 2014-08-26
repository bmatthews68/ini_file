action :create do
  create_inifile
  new_resource.updated_by_last_action(true)
end

action :create_if_missing do
  if !exists?
    create_inifile
    new_resource.updated_by_last_action(true)
  end
end

action :update do
  if exists?
    update_inifile
  else
    create_inifile
  end
  new_resource.updated_by_last_action(true)
end

def load_current_resource
  @current_resource = Chef::Resource::IniFile.new(new_resource.name)
  @current_resource.path(new_resource.path)
end

def create_inifile
  inifile = ::IniFile.new
  inifile.filename = new_resource.path
  new_resource.settings.each do |section, settings|
    settings.each do |name, value|
      inifile[section][name] = value
    end
  end
  inifile.write
end

def update_inifile
  inifile = ::IniFile.load(@current_resource.path)
  new_resource.settings.each do |section, settings|
    settings.each do |name, value|
      inifile[section][name] = value
    end
  end
  inifile.write
end

def exists?
  ::File.exists?(new_resource.path)
end