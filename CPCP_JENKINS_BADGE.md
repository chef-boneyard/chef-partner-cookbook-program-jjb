# How to acquire the CPCP Jenkins badge

Awesome! You're interested in getting the Chef Partner Cookbook Program Jenkins badge!

There are a couple steps you need to do before we can set everything up.

1. Contact the Partner Engineering team at partnereng@chef.io to start the interest in CPCP. One of the engineers should get back to you ASAP.
1. There will be a commit to [this][jobs] directory with your cookbook. You are more then welcome to fork and put in a PR to speed up the process, or suggest specific tests.
1. After the commit and the update happens, [jenkins][jenkins] should have your build, and the plugin should be available.
1. Then this link: https://jenkins-01.eastus.cloudapp.azure.com/job/YOUR-COOKBOOK/badge/icon should be available to add to your README.md

```
[![Build Status](https://jenkins-01.eastus.cloudapp.azure.com/job/YOUR-COOKBOOK/badge/icon)](https://jenkins-01.eastus.cloudapp.azure.com/job/YOUR-COOKBOOK)
```

[jobs]: https://github.com/chef-partners/chef-partner-cookbook-program-jjb/tree/master/jobs
[jenkins]: https://jenkins-01.eastus.cloudapp.azure.com/#
