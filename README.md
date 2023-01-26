# README

## railsblog



## development



## deployment
### aws Beantalk
to generate aws profile configuration
```aws
aws configure --profile eb_deploy
```

production migration (if needed)
```shell
rake db:migrate RAILS_ENV=production
```
build js/css in production
```shell

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