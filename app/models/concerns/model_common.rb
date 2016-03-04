module ModelCommon
  extend ActiveSupport::Concern
  
  included do
    def self::empty?
      self::first.nil?
    end
  end
end