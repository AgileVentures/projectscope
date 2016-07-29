class Config < ActiveRecord::Base
  belongs_to :project
  scope :for, ->(metric_name) { where(:metric_name => metric_name).limit(1) }
  validates_uniqueness_of :metric_name, :scope => :project_id
  serialize :options, Hash
end

