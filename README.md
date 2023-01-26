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
error:
```text
"Your bundle only supports platforms ["x86-mingw32"] but your local platforms are ["ruby", "x86_64-linux"]"
```
run
```shell
bundle lock --add-platform ruby
bundle lock --add-platform x86_64-linux
```

### testing
```shell
bundle exec rspec
```