github-repos
====================

[![Build Status](https://travis-ci.org/eighttrackmind/github-repos.png)](https://travis-ci.org/eighttrackmind/github-repos.png)
Fetch a user's repository count from Github

## Usage

```coffee
getRepos = require 'github-repos'

success = (count) -> ...
error = (err) -> ...
progress = (countSoFar) -> ...

getRepos 'someUserName', success, error, progress
```

## Features

- Uses promises
- Supports paginated responses
- Supports `progress` for paginated responses

## Supported environments

- Node
- CommonJS