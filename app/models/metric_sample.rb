class MetricSample < ActiveRecord::Base
  belongs_to :project
  scope :latest_for, ->(metric_name) { where(:metric_name => metric_name).last }
end
