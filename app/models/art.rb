class Art < ActiveRecord::Base
  include ModelCommon
  has_many :aarubies
end
