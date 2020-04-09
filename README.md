# Webeng-Builder
Small builder pod that watches a GitHub repository for events via https://smee.io/ webhooks.

Deploy both containers in a Kubernetes pod, define the environment variables
SMEE_URL and REPO_URL, mount the SSH private key to /home/node/.ssh/id_rsa,
and you're good to go.

## GitHub actions configuration
To actually trigger the build, you can use e.g. GitHub Actions:

````
name: Invoke deployment hook

on:
  push:
    branches: [ master ]

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
    - name: Invoke deployment hook
      uses: distributhor/workflow-webhook@v1
      env:
        webhook_url: <insert url here>
        webhook_secret: <generate a secure secret>
````


# License
````
MIT License

Copyright (c) 2020 Philipp Nowak (literalplus)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
````
