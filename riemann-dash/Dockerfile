# Start with a Ruby install of 2.0.0
# https://index.docker.io/u/paintedfox/ruby/
FROM paintedfox/ruby

MAINTAINER Koala <info@koala.im>

# Ensure latest packages installed
RUN apt-get update
RUN apt-get install -y --reinstall ca-certificates

# Install the dashboard gem
RUN gem install riemann-dash --no-doc

RUN mkdir /riemann-dash

ADD config.rb /riemann-dash/config.rb

# Default Riemann Dashboard Port Binding
EXPOSE 4567

WORKDIR /riemann-dash

# Expose the riemann dash gem command
ENTRYPOINT ["riemann-dash","/riemann-dash/config.rb"]
