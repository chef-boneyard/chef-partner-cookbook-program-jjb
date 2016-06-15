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

## Cookbooks

- [alertlogic][alertlogic]
- [graylog2][graylog2]


[cpcp]: https://www.chef.io/blog/2016/02/23/chef-launches-partner-cookbook-program-to-expand-devops-ready-technology-ecosystem/
[search]: https://supermarket.chef.io/cookbooks?utf8=✓&q=&badges%5B%5D=partner&platforms%5B%5D=
[alertlogic]: ./jobs/al_agents-cookbook.yml
[graylog2]: ./jobs/graylog2-cookbook.yml
