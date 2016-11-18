# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'project_metric_code_climate' 
require 'project_metric_slack_trends'
require 'project_metric_pivotal_tracker'

dummy1_code_climate = ProjectMetrics.class_for('code_climate').new url: 'http://github.com/AgileVentures/WebsiteOne'
dummy2_code_climate = ProjectMetrics.class_for('code_climate').new url: 'http://github.com/AgileVentures/project_metric_slack'

# generate images
dummy1_code_climate.image
dummy2_code_climate.image

slack1 = File.read './db/images/slack1.svg'
slack2 = File.read './db/images/slack2.svg'
slack3 = File.read './db/images/slack3.svg'
slack_trends1 = File.read './db/images/slack_trends1.svg'
slack_trends2 = File.read './db/images/slack_trends2.svg'
slack_trends3 = File.read './db/images/slack_trends3.svg'
pivot1 = File.read './db/images/pivot1.svg'
pivot2 = File.read './db/images/pivot2.svg'
github1 = File.read './db/images/github1.svg'
github2 = File.read './db/images/github2.svg'
github3 = File.read './db/images/github3.svg'


dummies = Hash.new
dummies["code_climate"] = [dummy1_code_climate.raw_data, dummy2_code_climate.raw_data, dummy1_code_climate.raw_data]
dummies["github"] = [github1, github2, github3]
dummies["slack"] = [slack1, slack2, slack3]
dummies["pivotal_tracker"] = [pivot1, pivot2, pivot2]
dummies["slack_trends"] = [slack_trends1, slack_trends2, slack_trends3]

projects_list = []
1.upto(20).each do |num|
	projects_list << Project.create!(:name => "Project #{num}")
end

end_date = Date.today
start_date = end_date - 14.days

start_date.upto(end_date) do |date|
    projects_list.each do |project|
        ProjectMetrics.metric_names.each do |metric|
            MetricSample.create!(:metric_name => metric,
                                 :project_id => project.id,
                                 :score => rand(0.0..4.0).round(2),
                                 :image => dummies[metric][rand(3)],
                                 :created_at => date)
        end
    end
end