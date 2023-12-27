# Launch a UVDesk Server

## UVDesk
UVDesk is a powerful open-source helpdesk and customer support solution designed to streamline ticket management and communication processes. It provides a feature-rich platform that enables businesses to efficiently handle customer queries, issues, and support requests.

We will deploy our UVDesk app using an acorn image.

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
 * **uvdesk/db_password** - Password for mariadb database (must be at least 10 characters)

Create secrets for your application using acorn-cli.  Change the <> values to your actual credentials.
```
acorn secret create uvdesk --data db_password=<password>
```

## Deploying Acorn
Now that we have the acorn cli configured, we can deploy our acorn image with a few simple commands.

Clone the repo locally if you haven't already with:

`git clone https://github.com/randall-coding/uvdesk-acorn.git`

Next build and run.

`acorn build -t uvdesk`

`acorn run -s uvdesk:uvdesk -n uvdesk uvdesk`

Visit your acorn dashboard to see if your deployment was successful.

Click on the uvdesk deployment, and find the endpoint section on the right side panel.  This is your uvdesk instance link.

![uvdesk_ui_div]()

![uvdesk_endpoint]()

If there are any errors check your acorn via the UI or with the following command:

`acorn logs -f uvdesk`

## Configure UVDesk

First you have to go to your acorn uvdesk URL. Then follow the on screen installation wizard for configuring your uvdesk.

![Welcome-wizard-2]()

Use the following database credentials to install your UVDesk instance:

- Server: `db`
- Port: `3306`
- Username: `uvdeskuser`
- Password: `secret://uvdesk/db_password`
- Database: `uvdesk`

Next, you will be prompt to create an admin account, follow the webpage's instruction to create one, then after proceeding you need to click on the "Install Now" button. After installing, you'll see this page:

To sign in as an admin you will need to add `/en/member/login` to the main endpoint of click "Admin Panel" after installation.

For more detailed instructions on working with your UVDesk server see the getting started and configuration documentation.

## Conclusion
That's all there is to it.  We've now got a UVDesk server up and running from an acorn image.

! Final image


## References
* [Install UVDesk](https://www.uvdesk.com/en/blog/installation-open-source-helpdesk-uvdesk/)
* [Getting started with Acorn](https://docs.acorn.io/getting-started)
