# README

# Active Storage [Test]

This is a little rails project to get you started with Active Storage. Storage hosts are pre-configured.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Clone the repository on your machine with the following commands.

```
With HTTPS
git clone https://github.com/Duckiduc/active-storage.git

With SSH (recommanded)
git clone git@github.com:Duckiduc/active-storage.git
```

Have Ruby installed on your machine.

### Installing

Step by step installation

Install a bundler

`gem install bundler`

Install the latest rails

`bundle install rails`

Install the dependencies / GEM

`bundle install`

## Deployment

Run the command `rails s` to start the server.

## Storage hosts setup

You need to uncomment the service you want to use and update the credentials

### Amazon S3

```
#config/storage.yml

amazon:
    service: S3
    access_key_id: XXXXXXXXXXXXXXXX
    secret_access_key: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    region: region
    bucket: bucket_name
```

```
#config/environments/development.rb

config.active_storage.service = :amazon
```

```
#config/environments/production.rb

config.active_storage.service = :amazon
```

### Google GCS

```
#config/storage.yml

google:
    service: GCS
    project: project_name
    credentials: XXXXXXXXXXXXXXXX
    bucket: bucket-name
```

```
#config/environments/development.rb

config.active_storage.service = :google
```

```
#config/environments/production.rb

config.active_storage.service = :google
```

### Microsoft Azure

```
#config/storage.yml

microsoft:
    service: AzureStorage
    storage_account_name: account_name
    storage_access_key: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    container: container-name
```

```
#config/environments/development.rb

config.active_storage.service = :microsoft
```

```
#config/environments/production.rb

config.active_storage.service = :microsoft
```

### Mirror

```
#config/storage.yml

mirror:
    service: Mirror
    primary: service_name
    mirrors:
        - service_name
```

> `service_name` being the service you want to use (`amazon`, `google`, `microsoft`)
> 
> You can use multiple mirros at once
> ```
>   mirrors
>       - amazon
>       - google
>       - microsoft
> ```

```
#config/environments/development.rb

config.active_storage.service = :mirror
```

```
#config/environments/production.rb

config.active_storage.service = :mirror
```

> Note that your credentials are not encrypted.

## Built With

### Languages
![languages-count](https://img.shields.io/badge/languages-6-orange)
* [Ruby](https://devdocs.io/ruby~2.6/) — Interpreted, high-level, general-purpose programming language
* [Rails](https://devdocs.io/rails~6.0/) - Server-side web application framework
* [HTML5](https://devdocs.io/html/) — Markup language
* [CSS3](https://devdocs.io/css/) — Style sheet language
* [SCSS](https://devdocs.io/sass/) - Style sheet language
* [JavaScript](https://devdocs.io/javascript/) — Programming language that conforms to the ECMAScript specs

Rails version used: `6.0.3.3`
Ruby version: `ruby 2.7.1p83`

## Versioning

We use the [Github](http://github.com/) for versioning.

## Authors

* **Duc-Thomas Nguyen** - *Initial work* - [LinkedIn](https://www.linkedin.com/in/duc-thomas-nguyen/)
