<a href="https://codeclimate.com/github/AgileVentures/projectscope_mvp"><img src="https://codeclimate.com/github/AgileVentures/projectscope_mvp/badges/gpa.svg" /></a>
<a href="https://travis-ci.org/AgileVentures/projectscope_mvp"><img src="https://travis-ci.org/AgileVentures/projectscope_mvp.svg?branch=master"></a>
# MVP dashboard for ProjectScope

A dashboard to show project metrics such as those supported by gems like 
[project_metric_code_climate](https://github.com/AgileVentures/project_metric_code_climate),
[project_metric_github](https://github.com/AgileVentures/project_metric_github),
and others, using the [project_metrics](https://github.com/AgileVentures/project_metrics) gem to wrap
them for consumption by a Rails app

Standing up an instance
-----------------------

Get set up with a Github Access token (for the github gem):

https://help.github.com/articles/creating-an-access-token-for-command-line-use/

Then run rails server like so:

```GITHUB_ACCESS_TOKEN=<YOUR_ACCESS_TOKEN> rails s```

Then you can use the web interface to create projects.  Both the above gems (github, codeclimate), require a key pair of

"url" "http://github.com/AgileVentures/LocalSupport"

specifying the github url for the project.  In order to generate sample metrics to show up in the project index page, 
run rails console like so:

```GITHUB_ACCESS_TOKEN=<YOUR_ACCESS_TOKEN> rails c```

if you then run

```Project.all.each &:resample_all_metrics```

on the console (and the GITHUB_ACCESS_TOKEN env var is set) it will generate a set of samples you can then see in the interface


