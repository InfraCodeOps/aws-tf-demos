# RDS Provisioning

This Terraform project defines an AWS RDS instance. It creates a PostgreSQL database instance with a specified engine version,
instance class, and storage type. It also creates a security group to allow inbound traffic to the database instance.

Inputs:
- db_name: The name of the database to create.
- db_username: The username for the database.
- db_password: The password for the database.
- db_instance_class: The instance class for the database instance.
- db_allocated_storage: The amount of storage to allocate for the database instance.
- db_engine_version: The version of the PostgreSQL engine to use.
- vpc_security_group_ids: A list of security group IDs to associate with the database instance.

Outputs:
- rds_endpoint: The endpoint for the created RDS instance.
- rds_hostname: The hostname (without the port)
- rds_port: The port number
- rds_username: The user name


# Testing
1. To test, install mysql client: `sudo apt install mysql-client`
2. Connect using `mysql -h $(terraform output -raw rds_hostname) -P $(terraform output -raw rds_port) -u $(terraform output -raw rds_username) -p`