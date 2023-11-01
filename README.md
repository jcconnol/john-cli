# john-cli

## Setup

Clone this package to a folder then add the path to your terminal setup.
Something to the effect of the following:
```bash
export PATH="$PATH:/c/Users/Jon/Desktop/software_eng/john-cli"
```

Also, create a gitlab api token and set the variable "JOHN_GITLAB_TOKEN" in your `zshrc` file. Similar to the following:
```bash
export JOHN_CLI_GITLAB_TOKEN=<some_api_token>
```

Also, set this git configuration so that the branch can be auto created:
```bash
git config --global push.default current
```
## Running

Run this by running the command `john` followed by an allowed command.
