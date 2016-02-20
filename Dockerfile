FROM heroku/ruby

RUN echo "export RACK_DEV_MARK_ENV=\"\${RACK_DEV_MARK_ENV:-$RACK_DEV_MARK_ENV}\"" >> /app/.profile.d/ruby.sh
