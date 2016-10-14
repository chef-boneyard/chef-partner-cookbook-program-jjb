# chef-partner-cookbook-program-jjb

These are a collection of Jenkins Job builders for the [Chef Partner Cookbook Program][cpcp].
The goal is to get a build per [this search][search] and have the verification
continually authenticated.

## Dealing with secrets/tokens with the JJB

There is a way to switch out tokens and other secrets for your jobs with a
rake task.

You need to set up a `secrets.yml` with something like the following:

```yaml
slack-auth-token: "KK5ZzeJhcMVBgM54_ANOTHER_FAKE_KEY_vTwZxJpuUYXetFnlha81EyH"
slack-build-server-url: "https://jenkins-01.eastus.cloudapp.azure.com/"
```

After this you can run the following:

```bash
$ bundle install
$ bundle exec rake
```

## Our Jenkins set up

We have our Jenkins setup [here][jenkins]. It's public and you're more then
welcome to take a look at it.

If you would like to update any of the jobs, you need to use the [update jobs][updatejobs]
job. Clone down the repo, and if it changes at all it'll update the corresponding
jobs.

We have added a new test that is being rolled out and that is a measure of the health of the cookbook project.  This measures the age of Issues and PRs.  If any have not been updated for 8 days then this will automatically fail the build.  The URL for each of the violations will be displayed in the console output.

## The Jenkins Job YAMLs for the Cookbooks
| Cookbook  | Build Status |
| ------------- | ------------- |
| [3scale][3scale] | [![Build Status](https://jenkins-01.eastus.cloudapp.azure.com/job/3scale-cookbook/badge/icon)](https://jenkins-01.eastus.cloudapp.azure.com/job/3scale-cookbook/) |
| [alertlogic][alertlogic] | [![Build Status](https://jenkins-01.eastus.cloudapp.azure.com/job/al_agents-cookbook/badge/icon)](https://jenkins-01.eastus.cloudapp.azure.com/job/al_agents-cookbook/) |
| [alteryx][alteryx] | [![Build Status](https://jenkins-01.eastus.cloudapp.azure.com/job/alteryx-cookbook/badge/icon)](https://jenkins-01.eastus.cloudapp.azure.com/job/alteryx-cookbook/) |
| [caskdata][caskdata] | [![Build Status](https://jenkins-01.eastus.cloudapp.azure.com/job/cdap-cookbook/badge/icon)](https://jenkins-01.eastus.cloudapp.azure.com/job/cdap-cookbook/) |
| [cloudpassage][cloudpassage] | [![Build Status](https://jenkins-01.eastus.cloudapp.azure.com/job/cloudpassage-cookbook/badge/icon)](https://jenkins-01.eastus.cloudapp.azure.com/job/cloudpassage-cookbook/) |
| [datadog][datadog] | [![Build Status](https://jenkins-01.eastus.cloudapp.azure.com/job/datadog-cookbook/badge/icon)](https://jenkins-01.eastus.cloudapp.azure.com/job/datadog-cookbook/) |n
| [dnsimple][dnsimple] | [![Build Status](https://jenkins-01.eastus.cloudapp.azure.com/job/dnsimple-cookbook/badge/icon)](https://jenkins-01.eastus.cloudapp.azure.com/job/dnsimple-cookbook/) |
| [dynatrace][dynatrace] | [![Build Status](https://jenkins-01.eastus.cloudapp.azure.com/job/dynatrace-cookbook/badge/icon)](https://jenkins-01.eastus.cloudapp.azure.com/job/dynatrace-cookbook/) |
| [graylog2][graylog2] | [![Build Status](https://jenkins-01.eastus.cloudapp.azure.com/job/graylog2-cookbook/badge/icon)](https://jenkins-01.eastus.cloudapp.azure.com/job/graylog2-cookbook/) |
| [icinga2][icinga2] | [![Build Status](https://jenkins-01.eastus.cloudapp.azure.com/job/icinga2-cookbook/badge/icon)](https://jenkins-01.eastus.cloudapp.azure.com/job/icinga2-cookbook/) |
| [ilo][ilo] | [![Build Status](https://jenkins-01.eastus.cloudapp.azure.com/job/ilo-cookbook/badge/icon)](https://jenkins-01.eastus.cloudapp.azure.com/job/ilo-cookbook/) |
| [maas][maas] | [![Build Status](https://jenkins-01.eastus.cloudapp.azure.com/job/maas-cookbook/badge/icon)](https://jenkins-01.eastus.cloudapp.azure.com/job/maas-cookbook/) |
| [oneview][oneview] | [![Build Status](https://jenkins-01.eastus.cloudapp.azure.com/job/oneview-cookbook/badge/icon)](https://jenkins-01.eastus.cloudapp.azure.com/job/oneview-cookbook/) |
| [rackspace_monitoring][rackspacemonitoring] | [![Build Status](https://jenkins-01.eastus.cloudapp.azure.com/job/rackspace_monitoring-cookbook/badge/icon)](https://jenkins-01.eastus.cloudapp.azure.com/job/rackspace_monitoring-cookbook/) |n
| [sensu][sensu] | [![Build Status](https://jenkins-01.eastus.cloudapp.azure.com/job/sensu-cookbook/badge/icon)](https://jenkins-01.eastus.cloudapp.azure.com/job/sensu-cookbook/) |
| [sumologic-collector][sumologiccollector] | [![Build Status](https://jenkins-01.eastus.cloudapp.azure.com/job/sumologic-collector-cookbook/badge/icon)](https://jenkins-01.eastus.cloudapp.azure.com/job/sumologic-collector-cookbook/) |
| [threatstack][threatstack] | [![Build Status](https://jenkins-01.eastus.cloudapp.azure.com/job/threatstack-cookbook/badge/icon)](https://jenkins-01.eastus.cloudapp.azure.com/job/threatstack-cookbook/) |


[cpcp]: https://www.chef.io/partners/cookbooks/
[search]: https://supermarket.chef.io/cookbooks?utf8=✓&q=&badges%5B%5D=partner&platforms%5B%5D=
[jenkins]: https://jenkins-01.eastus.cloudapp.azure.com/

[3scale]: ./jobs/3scale-cookbook.yml
[alertlogic]: ./jobs/al_agents-cookbook.yml
[alteryx]: ./jobs/alteryx-cookbook.yml
[caskdata]: ./jobs/cdap-cookbook.yml
[cloudpassage]: ./jobs/cloudpassage-cookbook.yml
[datadog]: ./jobs/datadog-cookbook.yml
[dnsimple]: ./jobs/dnsimple-cookbook.yml
[dynatrace]: ./jobs/dynatrace-cookbook.yml
[graylog2]: ./jobs/graylog2-cookbook.yml
[icinga2]: ./jobs/icinga2-cookbook.yml
[ilo]: ./jobs/ilo-cookbook.yml
[maas]: ./jobs/maas-cookbook.yml
[oneview]: ./jobs/oneview-cookbook.yml
[rackspacemonitoring]: ./jobs/rackspace_monitoring-cookbook.yml
[sensu]: ./jobs/sensu-cookbook.yml
[sumologiccollector]: ./jobs/sumologic-collector-cookbook.yml
[threatstack]: ./jobs/threatstack-cookbook.yml

[updatejobs]: https://jenkins-01.eastus.cloudapp.azure.com/job/update-jobs/
