FROM google/dart:latest

COPY ./bin ./bin
COPY ./config ./config
COPY ./lib ./lib
COPY ./views ./views
COPY ./web ./web
COPY ./pubspec.yaml ./pubspec.yaml

# Install dependencies, pre-build
RUN pub get

# Optionally build generaed sources.
# RUN pub run build_runner build

# Set environment, start server
ENV ANGEL_ENV=production
EXPOSE 3000
CMD dart bin/prod.dart
