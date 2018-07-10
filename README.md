# riemann-datadog

Docker container supporting Riemann / Riemann-Dash / Datadog

# build

```bash
docker-compose build
```

# run

Two optional environment variables: 

1. DATADOGKEY= forward events to datadog
2. UNIFORMHOST= set the hostname of forwarded events (defaults to "riemann")

e.g.

```bash
DATADOGKEY=xyz123 UNIFORMHOST=riemann.staging docker-compose up
```

# behold

Riemann @ http://localhost:4567

## License

Copyright © 2018 [Troy-West, Pty Ltd.](http://www.troywest.com)

Distributed under the Eclipse Public License either version 2.0 or (at your option) any later version.
