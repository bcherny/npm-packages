npm-packages
====================

[![Build Status](https://travis-ci.org/eighttrackmind/npm-packages.png)](https://travis-ci.org/eighttrackmind/npm-packages.png)
Fetch a user's package count from NPM

## Usage

```coffee
getPackages = require 'npm-packages'

success = (count) -> ...
error = (err) -> ...
progress = (countSoFar) -> ...

getPackages 'someUserName', success, error, progress
```

## Features

- Uses promises
- Supports paginated responses
- Supports `progress` for paginated responses

# Implementation notes

- Uses scraping (:[) because NPM has no API and the [npm-stats](https://npmjs.org/package/npm-stats) package is inconsistent and times out.
- Because of the scraping approach, we cannot differentiate between user that exist but have no repos, and users that don't exist. Either will return a rejected promise.

## Supported environments

- Node
- CommonJS