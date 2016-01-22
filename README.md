# AWS Cookbooks 101
Code for AWS Cookbooks 101 tutorial at: http://docs.aws.amazon.com/opsworks/latest/userguide/cookbooks-101.html

This is a great tutorial and very easy to follow.

The only trouble I had was on Example 9: Using Amazon EC2 Instances

I first messed up ChefDK by installing kitchen-ec2 gem - I think I used `sudu gem install kitchen-ec2` and there was a conflict and I chose yes to overwrite - then `kitchen converge` stopped working. I had to reinstall ChefDK and used
`chef gem install kitchen-ec2` to install ec2 driver and it somehow worked.

The .kitchen.yml configuration in the tutorial is outdated. Please check my file to see the working version.

 - I had to use EC2 console to find the right `image_id: ami-9abea4fb`
 - The path `ssh_key: ../../keys/hjwangoregon.pem` is relative to the .kitchen.yml file
 - I had to try a few different values for : availability_zone, instance_type, security_group_ids, subnet_id and eventually made it work
