$:.unshift *Dir[File.expand_path('../../files/default/vendor/gems/**/lib', __FILE__)]

module Helper
    require 'inifile'

    def create_inifile(path, settings)
        inifile = IniFile.new
        inifile.filename = path
        settings.each do |section, section_settings|
            section_settings.each do |name, value|
                inifile[section][name] = value
            end
        end
        inifile.write
    end

    def update_inifile(path, settings)
        inifile = IniFile.load(path)
        settings.each do |section, section_settings|
            section_settings.each do |name, value|
                inifile[section][name] = value
            end
        end
        inifile.write
    end

end
