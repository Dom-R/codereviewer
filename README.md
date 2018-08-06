# CodeReviewer

## Description

CodeReviewer is a code review bot made in Ruby, whose purpose is to manage pull requests on your repository.

**Warning: Currently it only monitors new pull requests and randomly assign a user from a collaborators list as a reviewer.**

## Setting Up

### Settings

CodeReviewer currently uses a YAML file, called `settings.yaml`, that contains the github usernames from all possible collaborators.

Configuration Example:
```
production:
    collaborators: [Waldo, Wenda, Odlaw, Wilma]
```

### Running It

#### Pure Ruby

Simply run: `RACK_ENV=production ruby app.rb`

#### Docker

Build a docker image with `docker build . -t codereviewer`

Then run it with `docker run -p 4567:4567 codereviewer`

## Upcoming Features

- [ ] Assign Reviewer/s from a group of a organization
- [ ] If you have any suggestions please open an Issue.
