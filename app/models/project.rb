class Project < ActiveRecord::Base
  has_many :configs
  has_many :metric_samples
  
  accepts_nested_attributes_for :configs

  def config_for(metric)
    #self.configs.for(metric).first || self.configs.build(:metric_name => metric)
    configs.where(:metric_name => metric).first || configs.build(:metric_name => metric)
  end
  # Returns a hash of the latest set of scores,
  # eg +{:github => 80, :code_climate => 95}
  attr_reader :current_scores

  # Returns a hash of latest current images as +data://+ URLs
  attr_reader :current_images

  # Recompute latest scores and images WITHOUT refreshing raw data
  def update_scores_and_images
    # Compute and cache newest scores and images based on latest sample data.
    # optional logic here to short-circuit the method if no new samples since last update
    ProjectMetric.metric_names.each do |metric|
      latest_sample = self.metric_samples.where(:metric_name => metric).first
      metric_instance = class_for(metric).new({}, latest_sample.raw_data)
      @current_scores[metric] = metric_instance.score
      @current_images[metric] = metric_instance.image
    end
  end

  # Refresh raw data for all metrics
  def refresh_all_metrics!
    # Update (re-sample) all metrics for this project
    ProjectMetric.metric_names.each do |metric|
      # get credentials hash for this metric
      credentials_hash = self.configs.where(:metric_name => metric).credentials
      sample = ProjectMetric.class_for(metric).new(credentials_hash) # abstract factory
      if (sample.refresh)
        self.metric_samples.create!(:metric_name => metric,:raw_data => sample.raw_data)
      end
    end
  end
  

end
