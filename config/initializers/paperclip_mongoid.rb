module Paperclip
  class << self
    def logger #:nodoc:
      Rails.logger
    end
  end
end

module Mongoid::Document::Extensions
  module InstanceMethods
    def logger
      self.class.logger
    end
  end

  module ClassMethods
    def column_names
      self.fields.keys
    end

    def logger
      Rails.logger
    end
  end
end

Mongoid::Document::ClassMethods.send :include,
Mongoid::Document::Extensions::ClassMethods