# Include hook code here
require 'settings_magic'

ActiveRecord::Base.send :include, SettingsMagic
