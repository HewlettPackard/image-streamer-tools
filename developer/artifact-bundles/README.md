# Developer artifacts for ImageStreamer v4.1 release

## Note: 
- All artifact bundles in this repo are compatible with ImageStreamer v4.1 release
- Click on 'Branch:' drop down menu on this page to get artifact bundles for other ImageStreamer releases

## Version History:

HPE-ImageStreamer-Developer-2017-08-28-v4.1.zip
 - Bug fixes 

## Artifact Bundle Contents

The UEFI grub image available in CentOS 6.7 distribution is used without any modification as a golden image in this artifact bundle. 

The planscripts in this artifact bundle inject text strings into /EFI/BOOT/message.txt to demonstrate that ImageStreamer is able to personalize the image. Upon booting the server with this image, the contents of the message.txt will be displayed on the console proving that server is able to boot the personalized image.

The details of the grub image is as follows:

Name : grub

Version : 0.97

Vendor : CentOS

Release : 94.el6

Summary : Grand Unified Boot Loader.

Description : GRUB (Grand Unified Boot Loader) is an experimental boot loader capable of booting into most free operating systems - Linux, FreeBSD, NetBSD, GNU Mach, and others as well as most commercial operating systems.


--------------------------------------------------------------------------------

	                 File name: HPE-ImageStreamer-Developer-2017-08-28-v4.1.zip
		Name (in manifest): HPE-ImageStreamer-Developer-2017-08-28-v4.1
		       Description: Artifact bundle to aid in learning and developing HPE Image Streamer artifacts		       
		             Dated: 2017-09-07 (15:44:32)

--------------------------------------------------------------------------------


Golden Images:

	        Name: HPE - Developer 1.0 - UEFI Test Image - 2017-03-24
	Description: HPE Golden Image for testing OS Deployment. This Golden Image includes a UEFI System Partition and a GRUB loader having a simple configuration to show a message on the server console at boot. 



Deployment Plans:

	        Name: User - Developer 1.0 - Deployment Test (UEFI) - 2017-03-24 (Type:OEDeploymentPlan)
	 Description: User editable deployment plan to deploy UEFI image
	GoldenImage: HPE - Developer 1.0 - UEFI Test Image - 2017-03-24

	        Name: HPE - Developer 1.0 - Deployment Test (UEFI) - 2017-03-24 (Type:OEDeploymentPlan)
	 Description: Read only deployment plan to deploy UEFI image
	GoldenImage: HPE - Developer 1.0 - UEFI Test Image - 2017-03-24



Build Plans:

	       Name: HPE - Developer 1.0 - example UEFI capture - 2017-03-24 (Type:capture)
	Description: Read only build plan to capture UEFI image

	       Name: HPE - Developer 1.0 - example attribute types - 2017-08-28 (Type:deploy)
	Description: Read only build plan to demonstrate various custom attribute types

	       Name: HPE - Developer 1.0 - example UEFI deploy - 2017-03-24 (Type:deploy)
	Description: Read only build plan to deploy UEFI image

	       Name: User - Developer 1.0 - example UEFI capture - 2017-03-24 (Type:capture)
	Description: User editable build plan to capture UEFI image

	       Name: User - Developer 1.0 - example UEFI deploy - 2017-03-24 (Type:deploy)
	Description: User editable build plan to deploy UEFI image


Plan Scripts:

	       Name: HPE - Developer 1.0 - add example messages to log - 2017-08-28 (deploy)
	   FullName: 0810dd42-492f-4914-bc3d-49ef183102b7_planscript.json
	Description: Add a example messages to the Image Streamer OS deployment log.


	       Name: User -  Developer 1.0 - example UEFI personalization script - 2017-03-24 (deploy)
	   FullName: 1ba1732f-0d3f-4dba-a811-86edd7a6d6c6_planscript.json
	Description: Example personalization script for example UEFI Golden Image. This script changes the loader message to include personalization settings from the OS deployment.


	       Name: HPE - Developer 1.0 - example UEFI personalization script - 2017-03-24 (deploy)
	   FullName: 24f3e49b-984e-45ef-bb34-2bee9a79e1cd_planscript.json
	Description: Example personalization script for example UEFI Golden Image. This script changes the loader message to include personalization settings from the OS deployment.


	       Name: HPE - Developer 1.0 - create empty OS Volume - 2017-07-07 (deploy)
	   FullName: a89f7138-1ed0-44ad-805c-b9c8f5b95784_planscript.json
	Description: Create an empty OS Volume to be used as the target for OS install. After OS install, the OS Volume may be used to capture a new Golden Image.


	       Name: HPE - Developer 1.0 - example UEFI generalization script - 2017-03-24 (capture)
	   FullName: ab5cfb6b-d4c4-4036-afee-29ea62441c0f_planscript.json
	Description: Example generalization script for example UEFI Golden Image. This script changes the loader message to remove personalization settings from the Golden Image being created.


	       Name: User - Developer 1.0 - example UEFI generalization script - 2017-03-24 (capture)
	   FullName: edb780fc-3058-40fa-bca3-ae34f13a7c5d_planscript.json
	Description: Example generalization script for example UEFI Golden Image. This script changes the loader message to remove personalization settings from the Golden Image being created.


	       Name: HPE - Developer 1.0 - attempt or fail deployment - 2017-03-24 (deploy)
	   FullName: f244c12d-a830-4432-92b6-6e1d5d46abca_planscript.json
	Description: Attempt or intentionally fail OS deployment. Intentionally failing deployment is useful to aid rapid development of artifacts.



