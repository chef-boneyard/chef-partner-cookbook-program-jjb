# chef-partner-cookbook-program-jjb

These are a collection of Jenkins Job builders for the [Chef Partner Cookbook Program][cpcp].
The goal is to get a build per [this search][search] and have the verification
continually authenticated.

- [alertlogic][alertlogic]
- [graylog2][graylog2]


[cpcp]: https://www.chef.io/blog/2016/02/23/chef-launches-partner-cookbook-program-to-expand-devops-ready-technology-ecosystem/
[search]: https://supermarket.chef.io/cookbooks?utf8=✓&q=&badges%5B%5D=partner&platforms%5B%5D=
[alertlogic]: ./jobs/al_agents-cookbook.yml
[graylog2]: ./jobs/graylog2-cookbook.yml
