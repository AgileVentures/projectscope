Development Process
------------------

Our default working branch is currently `master`.  We do work by creating branches off `master` for new features and bugfixes.  Any feature should include Cucumber acceptance tests and where approciate RSpec unit tests.  We try to avoid view and controller specs, and focus purely on unit tests at the model and service level where possible.  A bugfix may include an acceptance test depending on where the bug occurred, but fixing a bug should start with the creation of a test that replicates the bug, so that any bugfix submission will include an appropriate test as well as the fix itself.

Where possible please include a user story in the following form to indicate the higher level issue that is being addressed:

```gherkin
As an administrator
So that I can try new project metrics
I would like to be able to be able to add metrics with the minimum amount of effort

As an investigator
So that I can see how projects performed historically on new metrics
I would like to be able to apply new metrics to historical data on projects

As a metric designer
So that I can share my new metric 
I would like to be able to package my metric into a gem as simply as possible

As a project supervisor
So that I can quickly review project progress
I would like a view of metrics for a project that loads within 7 seconds, and ideally even faster 

As an administrator of another site that has projects 
So that I can quickly and reliably get stats on all our projects
I would like to be able to access the project metrics via API

```


Each developer will usually work with a [fork](https://help.github.com/articles/fork-a-repo/) of the [main repository on Agile Ventures](https://github.com/AgileVentures/projectscope_mvp). Before starting work on a new feature or bugfix, please ensure you have [synced your fork to upstream/develop](https://help.github.com/articles/syncing-a-fork/):

```
git pull upstream develop
```

Note that you should be re-syncing daily (even hourly at very active times) on your feature/bugfix branch to ensure that you are always building on top of very latest develop code.

We use [GitHub Issues](https://github.com/AgileVentures/projectscope_mvp/issues) to manage our work on features, chores and bugfixes. Every pull request should a corresponding GitHub issue, and when you create feature/bug-fix branches please include the id of the relevant issue, e.g.

```
git checkout -b 799_add_contributing_md
```

Please ensure that each commit in your pull request makes a single coherent change and that the overall pull request only includes commits related to the specific GitHub issue that the pull request is addressing.  This helps the project managers understand the PRs and merge them more quickly.

Whatever you are working on, or however far you get please do open a "Work in Progress" (WIP) [pull request](https://help.github.com/articles/creating-a-pull-request/) (just prepend your PR title with "[WIP]" ) so that others in the team can comment on your approach.  Even if you hate your horrible code :-) please throw it up there and we'll help guide your code to fit in with the rest of the project.


Before you make a pull request it is a great idea to sync again to the upstream develop branch to reduce the chance that there will be any merge conflicts arising from other PRs that have been merged to develop since you started work:

```
git pull upstream master
```

In your pull request description please include a sensible description of your code and a tag `fixes #<issue-id>` e.g. :

```
This PR adds a CONTRIBUTING.md file and a docs directory

fixes #799
```

which will mean that the issue is automatically linked to the pull request in the GitHub interface and when the pull request gets merged the issue will be closed.

See also [more details on submitting pull requests](how_to_submit_a_pull_request_on_github.md).

Pull Request Review
-------------------

Currently @tansaku and @armandofox are pairing on the project management of projectscope_mvp_.  The project managers will review your pull request as soon as possible.  The project managers can merge unilaterally if necessary, but in general both project managers should sign off on a pull request before it is merged.

The project managers will review the pull request for coherence with the specified feature or bug fix, and give feedback on code quality, user experience, documentation and git style.  Please respond to comments from the project managers with explanation, or further commits to your pull request in order to get merged in as quickly as possible.

To maximize flexibility add the project managers as collaborators to your projectscope_mvp fork in order to allow them to help you fix your pull request, but this is not required.

Code Style
-------------

We recommend the [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide)





