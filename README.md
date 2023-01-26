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
```shell
packages:
    yum:
        postgresql-devel: []
        amazon-linux-extras: []
        git: []
        patch: []
        gcc: []
        libxml2: []
        libxml2-devel: []
        libxslt: []
        libxslt-devel: []

commands:
    01_postgres_activate:
        command: sudo amazon-linux-extras enable postgresql14
    02_postgres_install:
        command: sudo yum install -y postgresql-devel
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

master.key
```text
.config/credentials.yml.enc
```
this file is encrypted, so that's why we can push


By default, the credentials file contains the application's secret_key_base. It can also be used to store other secrets such as access keys for external APIs.
We can put our other secrets, such as the JWT secret key and API key in here.

regenerate
```shell
rails credentials:edit 
# or 
EDITOR=vim rails credentials:edit 
```
```text
jwt:
   secret_key: hello

api: api-key

# Used as the base secret for all MessageVerifiers in Rails, including the one protecting cookies.
secret_key_base: ca8bae95decfb752601c30aff9bbe5e7f22587341f8b132765f2fb92ddab9d52d0ebf07b9ef840acce5aeeed9ed513c8329bb8cafdd1de06494a0d69c5466ee7
```
Don't forget to close the file and it will automatically save. The terminal will show this message.
```text
File encrypted and saved
```
using
```text
Rails.application.credentials.jwt[:secret_key] # hello
Rails.application.credentials.api # api-key
```

ref: 
- https://medium.com/hackernoon/how-to-set-up-a-rails-4-1-app-on-aws-with-elastic-beanstalk-and-postgresql-66d4e3412629
- https://dev.to/raaynaldo/the-power-of-rails-master-key-36fh