## TLD-based routing

To get TLD-based routing to work on a local machine, edit your `/etc/hosts`:

```
127.0.0.1  somedomain.com somedomain.co.uk
```

Then start the app:

```bash
bundle exec bin/rails server -p 7272
```

And visit the appropriate domain, e.g. `http://somedomain.com:7272` to view the US "site", `http://somedomain.co.uk:7272` for the UK "site".
