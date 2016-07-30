Then /debug/ do
  1 if debugger
  1
end

When /^I enter new "(.*)" config values/ do |metric, table|
  fieldset_id = metric.downcase.gsub(' ', '_') # "Code Climate" => "code_climate"
  (table.hashes.length - 1).times { click_link 'Add new' }
  idx = 0
  all_inputs = page.all("fieldset##{fieldset_id} .newf")
  table.hashes.each do |h|
    all_inputs[idx].set h['key']
    all_inputs[idx+1].set h['value']
    idx += 2
  end
end

Then /^there should be a project "(.*)" with config values/ do |name,table|
  proj = Project.includes(:configs).find_by_name!(name)
  table.hashes.each do |h|
    expect(proj.config_for(h['metric_name']).options[h['key']]).to eq(h['value'])
  end
end
