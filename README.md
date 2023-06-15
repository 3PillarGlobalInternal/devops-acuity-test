# POC

This is a proof of concept to create a mysql database with dummy data in aws with terraform. This data is created based in this https://filldb.info/

## Prerequisites

In order to create data base you first need to take in count followings steps

- Create an oidc provider in aws
- Need to create service role in aws
- Add secrets to github repo

### Create OICD provider

The first step in this process is to create an OIDC provider which you will use in the trust policy for the IAM role used in this action. To complete this follow this [aws documentation](https://aws.amazon.com/blogs/security/use-iam-roles-to-connect-github-actions-to-actions-in-aws/#Step)

### Creating service role

The procedure to create the IAM role and to scope the trust policy come from the AWS Identity and Access Management User Guide. For detailed instructions on how to configure a role, see [How to Configure a Role for GitHub OIDC Identity Provider](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-idp_oidc.html#idp_oidc_Create_GitHub)


### Add secrets to github

This secrets are the ones that will be used for create new data base and manage it. For this poc, secrets were stored in aws secret manager and github secrets. We will need:

- AWS_ROLE
- DEV_RDS_USER
- DEV_RDS_PASS

## execute workflow

- Create and test
- Destroy

### Create db with dummy data and test

Go to tab "Actions" and select the workflow called: "Create MySQL RDS with Terraform".

In the drop down choise, select "create" and clic in "Run workflow"

Wait until finish, take about 6min to crate infra dn populate data base.

To test data, you need to take the `rds_enpoint` generated in the end of the job and used in the next command in your terminal.

You need to had installed `mysql` in your computer. Install it doing `brew install mysql` in macOS.

Also you need to admin password in system variable to allow execute command to our db host. `export MYSQL_PWD=<password>` same password in Github secrets repo.

Then you can run this command to see the information in the database

```
mysql -h <rds_endpoint> -u admin < query.sql
```

### Destroy all reasources created

Go to tab "Actions" and select the workflow called: "Create MySQL RDS with Terraform".

In the drop down choise, select "destroy" and clic in "Run workflow"