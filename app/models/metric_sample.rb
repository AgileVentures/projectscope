# == Schema Information
#
# Table name: metric_samples
#
#  id                    :integer          not null, primary key
#  project_id            :integer
#  metric_name           :string
#  encrypted_raw_data    :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  encrypted_raw_data_iv :string
#  score                 :float
#  image                 :text
#

class MetricSample < ActiveRecord::Base
  belongs_to :project
  scope :latest_for, ->(metric_name) { where(:metric_name => metric_name).last }

  attr_encrypted :raw_data, :key => Figaro.env.attr_encrypted_key!
end
