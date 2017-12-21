# Developer artifacts for ImageStreamer v4.0 release

## Note: 
- All artifact bundles in this repo are compatible with ImageStreamer v4.0 release
- Click on 'Branch:' drop down menu on this page to get artifact bundles for other ImageStreamer releases

## Version History:
HPE-ImageStreamer-Developer-2017-07-07-v3.0.zip
 - Bug fixes
 
 HPE-ImageStreamer-Developer-2017-03-24.zip
  - Initial Version

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

	            File name: HPE-ImageStreamer-Developer-2017-07-07-v3.0.zip
		Name (in manifest): HPE-ImageStreamer-Developer-2017-07-07
		       Description: Artifact bundle to aid in learning and developing HPE Image Streamer artifacts		       
		             Dated: 2017-07-07 (07:04:39)

--------------------------------------------------------------------------------


Golden Images:


	        Name: HPE - Developer 1.0 - UEFI Test Image - 2017-03-24
	Description: HPE Golden Image for testing OS Deployment. This Golden Image includes a UEFI System Partition and a GRUB loader having a simple configuration to show a message on the server console at boot. 



Deployment Plans:


	        Name: User - Developer 1.0 - Deployment Test (UEFI) - 2017-03-24 (Type:OEDeploymentPlan)
	 Description: User editable deployment plan to deploy UEFI image
	GoldernImage: HPE - Developer 1.0 - UEFI Test Image - 2017-03-24




	        Name: HPE - Developer 1.0 - Deployment Test (UEFI) - 2017-03-24 (Type:OEDeploymentPlan)
	 Description: Read only deployment plan to deploy UEFI image
	GoldernImage: HPE - Developer 1.0 - UEFI Test Image - 2017-03-24





Build Plans:


	       Name: HPE - Developer 1.0 - example UEFI capture - 2017-03-24 (Type:capture)
	Description: User editable build plan to capture UEFI image




	       Name: User - Developer 1.0 - example UEFI capture - 2017-03-24 (Type:capture)
	Description: User editable build plan to deploy UEFI image


	       Name: HPE - Developer 1.0 - example attribute types - 2017-07-07 (Type:deploy)
	Description: Read only build plan to deploy UEFI image


	       Name: User - Developer 1.0 - example UEFI deploy - 2017-03-24 (Type:deploy)
	Description: Build plan to demonstrate various custom attribute types


	       Name: HPE - Developer 1.0 - example UEFI deploy - 2017-03-24 (Type:deploy)
	Description: Read only build plan to capture UEFI image



Plan Scripts:

	       Name: HPE - Developer 1.0 - example UEFI personalization script - 2017-03-24 (deploy)
	   FullName: 5915de72-d411-4826-9224-0884495cdf16_planscript.json
	Description: Example personalization script for example UEFI Golden Image. This script changes the loader message to include personalization settings from the OS deployment.


	       Name: HPE - Developer 1.0 - add example messages to log - 2017-03-24 (deploy)
	   FullName: a1118562-8a0c-4508-b1c5-d9ba91e6d96f_planscript.json
	Description: Add a example messages to the Image Streamer OS deployment log.

	       Name: HPE - Developer 1.0 - attempt or fail deployment - 2017-03-24 (deploy)
	   FullName: a2a56de8-9406-40ae-8992-873c4b741b6d_planscript.json
	Description: Attempt or intentionally fail OS deployment. Intentionally failing deployment is useful to aid rapid development of artifacts.


	       Name: User -  Developer 1.0 - example UEFI personalization script - 2017-03-24 (deploy)
	   FullName: af01df78-a828-447d-9267-7c149d334c79_planscript.json
	Description: Example personalization script for example UEFI Golden Image. This script changes the loader message to include personalization settings from the OS deployment.


	       Name: User - Developer 1.0 - example UEFI generalization script - 2017-03-24 (capture)
	   FullName: c57ebf3a-f1b4-408a-bef2-ba182de65554_planscript.json
	Description: Example generalization script for example UEFI Golden Image. This script changes the loader message to remove personalization settings from the Golden Image being created.


	       Name: HPE - Developer 1.0 - create empty OS Volume - 2017-07-07 (deploy)
	   FullName: d506d12f-1400-41f8-b252-f637f236759c_planscript.json
	Description: Create an empty OS Volume to be used as the target for OS install. After OS install, the OS Volume may be used to capture a new Golden Image.

	       Name: HPE - Developer 1.0 - example UEFI generalization script - 2017-03-24 (capture)
	   FullName: ec5ccae4-7a69-4164-b96f-8f4e193ca1a8_planscript.json
	Description: Example generalization script for example UEFI Golden Image. This script changes the loader message to remove personalization settings from the Golden Image being created.






