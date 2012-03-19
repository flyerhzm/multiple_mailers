# MultipleMailers

extend actionmailer to allow one smtp account per mailer class.

## Installation

Add this line to your application's Gemfile:

    gem 'multiple_mailers'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install multiple_mailers

## Usage

define your smtp mailer accounts in `config/mailers.yml`

    production:
      default: &default
        address: 'smtp.gmail.com'
        port: 587
        domain: 'railsbp.com'
        authentication: 'plain'

      notification:
        <<: *default
        user_name: 'notification@railsbp.com'
        password: 'password'

      exception.notifier:
        <<: *default
        user_name: 'exception.notifier@railsbp.com'
        password: 'password'

the default account is used for all mailer classes, if you want to
override it, you can define mailer account for any mailer class you
want, like

    class NotificationMailer < ActionMailer::Base
      mailer_account "notification"
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
