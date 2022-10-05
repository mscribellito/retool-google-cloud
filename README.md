# Self-hosted Retool on Google Cloud

Deploy a single, self-hosted [Retool](https://retool.com/) instance on a VM in Google Cloud.

## Config

Create a tfvars file using the minimum example below.

```
project_id         = "your-gcp-project-id"
retool_version     = "2.99.5"
retool_license_key = "your-license-key"
retool_domain      = "retool.yourcompany.com"
```

A list of Retool version numbers can be viewed at https://docs.retool.com/docs/self-hosted-release-notes. Obtain your license key from https://my.retool.com.

## Deploy

### Run Terraform

```bash
# initialize directory
terraform init

# preview changes
terraform plan

# provision infrastructure
terraform apply
```

### Configure DNS

Create an A record pointing to the external IP of your Retool instance.

## Disclaimer

This code is provided "as is" with no warranty. It is intended to be a starting point for getting started with a self-hosted Retool instance.

Always store your Terraform state remotely and follow best practices for cloud security.

## Resources

* [Self-hosted Retool](https://docs.retool.com/docs/self-hosted)
* [GCP Deploy With Compute Engine Virtual Machine](https://github.com/tryretool/retool-onpremise#gcp-deploy-with-compute-engine-virtual-machine)

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)