actions :create,:create_if_missing,:update
default_action :update

attribute :path, :kind_of => String, :name_attribute => true
attribute :settings, :kind_of => Hash
