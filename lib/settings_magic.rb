# SettingsMagic

module SettingsMagic
  def self.included(base)
    base.extend(ClassMethods)
  end
 
  module ClassMethods
    def settings_for klass, method
      pre = klass.pluralize.downcase + '_'
      klass = eval klass
      self.class.send :define_method, pre + method.to_s do
        result = []
        klass.send(method.to_sym).each do |f|
          result << Setting.find_or_create_by_name({ :name => pre + f, :wert => f.humanize })
        end
        result
      end
    end
  end
end
