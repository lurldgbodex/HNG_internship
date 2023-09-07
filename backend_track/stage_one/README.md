# Stage One Task

## Objective
Create and host an endpoint using any programming language of your choice. The endpoint should take two GET request query parameters and return specific information in JSON format.

## Requirements
The information required includes:
* slack name
* current day of the week
* current UTC time(with validation of + / -2)
* Track
* The github url of the file being run
* The github url of the full source code.
* A status code of success

## JSON response
```
{
    'slack_name': 'example_name',
    'current_day': 'Monday',
    'utc_time': '2023-08-21T15:04:05Z',
    'track': 'backend',
    'github_file_url': 'https://github.com/username/repo/blob/main/file_name.txt',
    'github_repo_url': 'https://github.com/username/repo',
    'status_code': 200
}
```

## Acceptance criteria
* provide a publicly accessible endpoint
* GET Parameters: The endpoint should accept two GET request query parameters: slack_name and track. e.g. http://example.com/api?slack_name=slack&track=backend.
* Endpoint's response should adhere to the specified json format
