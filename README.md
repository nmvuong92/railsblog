## railsblog

## development
migration
```shell
rake db:migrate RAILS_ENV=development
```
build js/css/assets in development
```
./bin/webpack-dev-server
```
build js/css/assets in production
```shell
rake assets:precompile 
```
## deployment
### aws Beantalk
to generate aws profile configuration
```shell
aws configure --profile eb_deploy
```
init with profile (no needed)
```shell
eb init --profile eb_deploy
```
deploy with profile
```shell
eb deploy --profile eb_deploy
cat ~/.aws/credentials
[eb_deploy]
aws_access_key_id = xxx
aws_secret_access_key = xxx
```
## issues
### fix gemfile.lock
issue 1:
```text
"Your bundle only supports platforms ["x86-mingw32"] but your local platforms are ["ruby", "x86_64-linux"]"
```
run
```shell
bundle lock --add-platform ruby
bundle lock --add-platform x86_64-linux
```

issue 2: An error occurred while installing pg (1.4.5), and Bundler cannot continue.
with aws linux 1
```
packages:
  yum:
    postgresql-devel: []
```
with aws linux 2
```

```
### testing
```shell
bundle exec rspec
```


### debugging production
download logs file from EB -> .elasticbeanstalk/logs/xxx.zip
```shell
eb logs -z
```


ref: 
- https://medium.com/hackernoon/how-to-set-up-a-rails-4-1-app-on-aws-with-elastic-beanstalk-and-postgresql-66d4e3412629