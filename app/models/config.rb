class Config < ActiveRecord::Base
  belongs_to :project
  validates_uniqueness_of :metric_name, :scope => :project_id
  serialize :options, Hash
end

