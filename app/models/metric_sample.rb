class MetricSample < ActiveRecord::Base
  belongs_to :project
  # scope :for, ->(metric_name) { where(metric_name: metric_name) }
end
