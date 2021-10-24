# arena-lambda-action
A GitHub composed action to build and deploy lambdas

## How to use

Create a file in your project `.github/workflow/deployment.yml` with the following content:

```yml
name: The Build name

on:
  push:
  schedule:
    - cron:  '0 5 1 * *' # important to keep the lint data updated on the spreadsheet

jobs:
  validate_and_deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Run imported action
        uses: stationfy/arena-lambda-action@main
        with:
          ignore_lint_errors: false # In case of the project has many errors, turning not viable fix all now, change this value to not break the build
          eslint_project_list: . # when you have a monorepo project, include the list of subproject paths separated by comma
          project_name: api-customers # The name used on spreadsheet and slack notification
          team: backend # the team name used in statistics
```

## Configuration

###  team

* required: true
* description: The name of the team. egg: backend, frontend, growth

### spreadsheet_id:

* description: The id of spreadsheet to send the lint data
* required: true

### eslint_project_list:

* description: A list of subproject separated by comma. If it is just one project on root dir, use just one `.`
* required: true

### ignore_lint_errors:

* description: In case of the project has many errors, turning not viable fix all now, change this value to not break the build
* required: false
* default: false

### project_name:

* description: The name used in the spreadsheet
* required: true

## Features

* Run eslint on projects
* Collect eslint data and send to default spreadsheet
* Run tests
* Deploy for dev environment when changes develop branch
* Deploy for production/prd when changes main/master branch
