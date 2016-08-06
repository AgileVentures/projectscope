class Project < ActiveRecord::Base
  has_many :configs
  has_many :metric_samples

  validates :name, :presence => true, :uniqueness => true

  accepts_nested_attributes_for :configs
  attr_accessible :name, :configs_attributes

  def config_for(metric)
    configs.where(:metric_name => metric).first || configs.build(:metric_name => metric)
  end

  def latest_metric_samples
    ProjectMetrics.metric_names.map do |metric_name|
      metric_samples.where(metric_name: metric_name).last
    end
  end

  def resample_all_metrics
    ProjectMetrics.metric_names.each do |metric|
      credentials_hash = self.configs.where(:metric_name => metric).first.options
      sample = ProjectMetrics.class_for(metric).new(credentials_hash)
      if (sample.refresh)
        self.metric_samples.create!(metric_name: metric,
                                    raw_data: sample.raw_data,
                                    score: sample.score,
                                    image: sample.image
        )
      end
    end
  end

end
