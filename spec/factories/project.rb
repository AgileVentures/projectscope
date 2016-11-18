FactoryGirl.define do

  factory :metric_sample do
  	metric_name "test_metric"
  	sequence(:score) { |n| n }
  	created_at Date.today
  end

  factory :project do
  	sequence(:name) { |n| "Project #{n}" }
  	factory :project_with_many_metric_samples do
  		transient do
  			metric_samples_count 5
  		end

  		after(:create) do |project, evaluator|
  			create_list(:metric_sample, evaluator.metric_samples_count, project: project)
  		end
  	end
  end

end
