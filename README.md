![VMware][logo]
# VMware HealthAnalyzer Collector (VHA) Docker image
This Docker version is not affiliated with or endorsed by the VMware Professional Services Tools team, who maintain and builds the official version.
***Only to to be used at your own risk.*** The intent is to have a Docker alternative to the official Java and OVA builds.

Latest official VHA release is 5.4.0 and this Docker image is based on that VHA version.

## VHA Introduction
VMware HealthAnalyzer automates the collection and analysis of VMware Horizon, VMware vSphere, and VMware NSX for vSphere inventory, including configuration and utilization data.
VMware HealthAnalyzer Collector gathers Horizon View and vSphere inventory data from the systems in your environment. You can then export the data and send it to VMware or a VMware partner for analysis.
VMware HealthAnalyzer provides consistent, scalable data collection:
- vSphere – Data can be collected from a specified VMware vCenter Server® and other systems within the vSphere infrastructure.
- VMware Horizon – Data for analysis of desktop systems can be captured from a View Connection Server, VMware App VolumesTM Manager, and all of the systems with related data within the vSphere infrastructure.
- VMware NSX for vSphere – Data can be collected from VMware NSX Manager (standalone or Cross-vCenter Server setup) and VMware NSX Controller instances.

### Intended users
This information is intended for use only by 
- VMware Technical Account Managers (TAM)
- VMware Professional Services consultants
- VMware partners
- VMware customers who have a current Services Software Solutions subscription.
*Are you are a VMware customer, but not engaged in a Health Analalyer project with either your VMware TAM or a VMware Professional Services consultant, then there is no way for you to get any use out of this tool*

[Click here to read more about what a VMware Technical Account Manager can bring to your organization.](https://www.vmware.com/professional-services/optimization-advocacy.html)

### Security
| Port | Protocol | Discription |  |
| ------ | ------ | ------ | ------ |
| ~~22~~ | ~~SSH~~ | ~~Inbound TCP port that is used by an administrator to log in to the VMware HealthAnalyzer virtual appliance to perform maintenance tasks. This port is not used by the VMware HealthAnalyzer application.~~ This port is also used for outbound collection tasks to external NSX Controllers. | Some parts not applicable for the Docker version  |
| 433 | HTTPS | Outbound TCP port that is used by VMware HealthAnalyzer to retrieve data from the targeted vCenter Server, NSX Manager, and App Volumes Manager. This port is specified when configuring VMware HealthAnalyzer to retrieve data and might be different depending on the environment. |  |
| 7444 | HTTPS | Outbound TCP port Outbound TCP port that is used by VMware HealthAnalyzer to retrieve data from the customer’s vCenter Server using SSO. |  | 
| 8080 | HTTP | Inbound TCP port that is used by the VMware HealthAnalyzer user interface. |  |
| 80 and 8080 | HTTP | Both inbound TCP ports are used by the VMware HealthAnalyzer virtual appliance user interface. |  |
| 41984 |  | Port used for the VMware HealthAnalyzer database. | Internal use only. Not default exposed in the Docker version  |
| 41985 |  | Port used for VMware HealthAnalyzer database event service. | Internal use only. Not default exposed in the Docker version  |
| ~~5480~~ | ~~HTTPS~~ | ~~Inbound TCP port used to access the TAM Data Collector virtual appliance management Web interface from a browser.~~ | Not applicable for the Docker version  |

### Working with VHA Collector
See section 3 in the [VMware HealthAnalyzer Collector Install and User Guide](http://ftpsite.vmware.com/download/rlspsrl/HAnalyzer/vha540/VMware%20HealthAnalyzer%20Collector%20Install%20And%20User%20Guide%20v5.4.0.pdf) on how to collect and export data.

## Docker image

***Available on Docker Hub at [kimtholstorf/vha-collector](https://hub.docker.com/r/kimtholstorf/vha-collector/)***
```sh
docker pull kimtholstorf/vha-collector
```
or 
```sh
docker run -d -p 8080:8080 kimtholstorf/vha-collector:latest
```
If you insist you can build the image yourself:
```sh
git clone git@github.com:KimTholstorf/docker-vha-collector-alpine.git docker-vha-collector-alpine
cd docker-vha-collector-alpine
docker build -t kimtholstorf/vha-collector .
```
then run the image with port 8080 exposed
```sh
docker run -d -p 8080:8080 kimtholstorf/vha-collector
```
Verify the deployment by navigating to your server address in your preferred browser.

```sh
https://$(docker_host):8080/vha/HealthAnalyzer.html#!explore
https://localhost:8080/vha/HealthAnalyzer.html#!explore
```

## Official VMware version (Collector version only)
### Downloads
- [VHA 5.4.0 OVA Build](https://ftpsite.vmware.com/download?domain=FTPSITE&id=856dbfffc90845e6863e18734a467d76-0194dd58adc742d49f3050f0f1046fdc)
- [VHA 5.4.0 Build](http://ftpsite.vmware.com/download/rlspsrl/tdm/2.1.7/GA/tdm-2.1.7-GA-build-9468226-Java-PRODUCTION.zip)
### Documentation
- [VHA 5.4.0 Collector Install and User Guide](http://ftpsite.vmware.com/download/rlspsrl/HAnalyzer/vha540/VMware%20HealthAnalyzer%20Collector%20Install%20And%20User%20Guide%20v5.4.0.pdf)


[logo]: https://www.vmware.com/etc/clientlibs/onebrand/images/logoGrey.png