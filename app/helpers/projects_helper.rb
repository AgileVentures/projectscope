module ProjectsHelper
  def setup_metric_configs(project)
    ProjectMetrics.metric_names.each do |metric|
      if project.configs.where(:metric_name => metric).empty?
        project.configs.build(:metric_name => metric)
      end
    end
    project
  end
end
