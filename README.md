# Sweet Tooth

## Setup

1. Create a local bundler config and set the `BUNDLE_PATH` to be `$(pwd)/.gems`

  ```
  echo "BUNDLE_PATH: '$(pwd)/.gems'" >> .bundle/config
  ```

1. Build local bundler dependencies

  ```bash
  bundle install
  ```

1. Build app bundler dependencies

  ```bash
  bundle exec rake bundle:install
  ```

1. Now build the image(s)

  ```bash
  docker-compose build master
  ```

1. Create the databases.  

  - First, in one shell start the db:

    ```bash
    docker-compose up postgres
    ```

  - Now, in a separate shell, create the databases

    ```bash
    psql postgres://postgres:postgres@$(docker-compose port postgres 5432)/postgres -c 'create database sweet_tooth_webapp_development;'
    psql postgres://postgres:postgres@$(docker-compose port postgres 5432)/postgres -c 'create database sweet_tooth_webapp_test;'
    psql postgres://postgres:postgres@$(docker-compose port postgres 5432)/postgres -c 'create database sweet_tooth_clientsvc_development;'
    psql postgres://postgres:postgres@$(docker-compose port postgres 5432)/postgres -c 'create database sweet_tooth_clientsvc_test;'
    ```

1. Start the system

  ```bash
  docker-compose up
  ```

1. Browse, baby:

  ```bash
  open http://somedomain.com:$(docker-compose port webapp 3000)
  ```

## Notes

### TLD-based routing

To get TLD-based routing to work on a local machine, edit your `/etc/hosts`:

```
127.0.0.1  somedomain.com somedomain.co.uk
```

Then start the app:

```bash
bundle exec bin/rails server -p 7272
```

And visit the appropriate domain, e.g. `http://somedomain.com:7272` to view the US "site", `http://somedomain.co.uk:7272` for the UK "site".

### Overview

Uses Rails 5 w/ built-in webpack/react support, i.e. [`webpacker`](https://github.com/rails/webpacker) and [`react-rails`](https://github.com/reactjs/react-rails).

- The Rails [router](https://github.com/adamstrickland/sweet_tooth/blob/master/config/routes.rb) routes to the appropriate controller [here](https://github.com/adamstrickland/sweet_tooth/blob/master/config/routes.rb#L2-L3).
- The region-specific controllers ([us](https://github.com/adamstrickland/sweet_tooth/blob/master/app/controllers/us_controller.rb) & [uk](https://github.com/adamstrickland/sweet_tooth/blob/master/app/controllers/uk_controller.rb)) are no-op, simply rendering a "static" (from the Rails perspective) view.
- The region-specific views render region-specific React-components:
  - The [US view](https://github.com/adamstrickland/sweet_tooth/blob/master/app/views/us/index.html.erb) renders a top-level `UsGateway` component
    - The [`UsGateway`](https://github.com/adamstrickland/sweet_tooth/blob/master/app/javascript/components/UsGateway.js) component renders:
      - [the plain-jane](https://github.com/adamstrickland/sweet_tooth/blob/master/app/views/us/index.html.erb#L8) `Gateway` and 
      - [a plain-jane](https://github.com/adamstrickland/sweet_tooth/blob/master/app/javascript/components/UsGateway.js#L9) `Registration` components.
  - The [UK view](https://github.com/adamstrickland/sweet_tooth/blob/master/app/views/us/index.html.erb) renders a top-level `UkGateway` component
    - The [`UkGateway`](https://github.com/adamstrickland/sweet_tooth/blob/master/app/javascript/components/UkGateway.js) component renders:
      - [the plain-jane](https://github.com/adamstrickland/sweet_tooth/blob/master/app/javascript/components/UkGateway.js#L8) `Gateway` and 
      - [a `Registration` component that wraps an additional control](https://github.com/adamstrickland/sweet_tooth/blob/master/app/javascript/components/UkGateway.js#L9-L16).
- The [`Gateway`](https://github.com/adamstrickland/sweet_tooth/blob/master/app/javascript/components/Gateway.js) and [`Registration`](https://github.com/adamstrickland/sweet_tooth/blob/master/app/javascript/components/Registration.js) components are standalone.
