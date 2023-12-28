# Launch your own support ticket server
## UVdesk
UVdesk is a powerful open-source helpdesk and customer support solution designed to streamline ticket management and communication processes. It provides a feature-rich platform that enables businesses to efficiently handle customer queries, issues, and support requests.

To make things even easier, we will deploy our UVdesk server using an acorn image.

![image](https://github.com/randall-coding/uvdesk-acorn/assets/39175191/5c3f2dc0-67b9-46e9-915a-3ed36689f111)

## What is Acorn?
Acorn is a new cloud platform that allows you to easily deploy, develop and manage web services with containerization.  A single acorn image can deploy all that you need: from a single container webserver, to a multi service Kubernetes cluster with high availability.  Don't worry if you don't understand what all those terms mean; we don't have to know that in order to deploy our server.

## Setup Acorn Account
Setup an acorn account at [acorn.io](https://acorn.io).  This can be a free account for your first deployment, and if you'd like additional storage space you can look into the pro account or enterprise.  You will need a Github account to signup as shown in the image below.

![signin_acorn](https://github.com/randall-coding/opensupports-docker/assets/39175191/d46815fb-d2d5-42cd-b93d-41ca541a63bd)

## Install acorn cli 
First we need to install acorn-cli locally.  Choose an install method from the list below:

**Linux or Mac** <br>
`curl https://get.acorn.io | sh`

**Homebrew (Linux or Mac)** <br>
`brew install acorn-io/cli/acorn`

**Windows** <br> 
Uncompress and move the [binary](https://cdn.acrn.io/cli/default_windows_amd64_v1/acorn.exe) to your PATH

**Windows (Scoop)** <br>
`scoop install acorn`

For up to date installation instructions, visit the [official docs](https://runtime-docs.acorn.io/installation/installing).

## Login with CLI
Back in our local command terminal login to acorn.io with: <br>
`acorn login acorn.io` 

## Preparing Secrets
Your server has settings controlled by a "secrets" object: 
 * **password** - Password for mariadb database (must be at least 10 characters)

Create secrets for your application using acorn-cli.  Change the <> values to your actual credentials.
```
acorn secret create uvdesk-mariadb 
  --data password=<password>
  --data username=uvdeskuser
```

## Deploying Acorn
Now that we have the acorn cli configured, we can deploy our acorn image with a few simple commands.

Clone the repo locally if you haven't already with:

`git clone https://github.com/randall-coding/uvdesk-acorn.git`

Next build and run.

`acorn build -t uvdesk`

`acorn run -s uvdesk-mariadb:uvdesk-mariadb -n uvdesk uvdesk`

Visit your acorn dashboard to see if your deployment was successful.

Click on the uvdesk deployment, and find the endpoint section on the right side panel.  This is your uvdesk instance link.

![uvdesk_acorn_ui](https://github.com/randall-coding/uvdesk-acorn/assets/39175191/fd65bf1c-011f-4fb8-a0da-3bfc019baa47)

![uvdesk_endpoint](https://github.com/randall-coding/uvdesk-acorn/assets/39175191/38aaa881-c316-4ca3-b7fd-fc2c9f2a6e7e)

## Configure UVdesk

First you have to go to your acorn uvdesk URL. Then follow the on screen installation wizard for configuring your uvdesk.

![image](https://github.com/randall-coding/uvdesk-acorn/assets/39175191/f44b2eb0-0c74-4fa2-b13f-45f8c95a0820)

Use the following database credentials to install your UVdesk instance:

- Server: `mariadb`
- Port: `3306`
- Username: `uvdeskuser`
- Password: `password added in your secret`
- Database: `uvdesk`

Next, you will be prompt to create an admin account, follow the webpage's instruction to create one, then after proceeding you need to click on the "Install Now" button. After installing, you'll see this page:

![uvdesk_success](https://github.com/randall-coding/uvdesk-acorn/assets/39175191/572affd9-a56f-4aae-a57a-7fc04c95db18)

To sign in as an admin you will need to add `/en/member/login` to the main endpoint url or click "Admin Panel" after installation.

## Conclusion
That's all there is to it.  We've now got a UVdesk server up and running from an acorn image.
For more detailed instructions on working with your UVdesk server see the getting started and configuration documentation.

## References
* [Install UVdesk](https://www.uvdesk.com/en/blog/installation-open-source-helpdesk-uvdesk/)
* [UVdesk documentation](https://docs.uvdesk.com)
* [Getting started with Acorn](https://docs.acorn.io/getting-started)
