# Support tools



This artifact bundle contains artifacts to verify Image Streamer installation and configuration by doing a simple deployment using UEFI grub image.
The UEFI grub image available in CentOS 6.7 distribution is used without any modification as a golden image in this artifact bundle. 



The planscripts in this artifact bundle inject text strings into /EFI/BOOT/message.txt to demonstrate that ImageStreamer is able to personalize the image. Upon booting the server with this image, the contents of the message.txt will be displayed on the console proving that server is able to boot the personalized image.

The details of the grub image is as follows:

Name : grub

Version : 0.97

Vendor : CentOS

Release : 94.el6

Summary : Grand Unified Boot Loader.

Description : GRUB (Grand Unified Boot Loader) is an experimental boot loader capable of booting into most free operating systems - Linux, FreeBSD, NetBSD, GNU Mach, and others as well as most commercial operating systems.


#Artifact Bundle Contents
--------------------------------------------------------------------------------
         File name: HPE-Support-Artifacts-2017-03-24.zip
         Name (in manifest): HPE-Support-Artifacts-2017-03-24
       Description: Artifacts to verify Image Streamer installation and configuration
             Dated: 2017-03-25 (04:14:51)
--------------------------------------------------------------------------------

Golden Images:

	        Name: HPE - Support 1.0 - UEFI Test Image - 2017-03-24
	Description: HPE Golden Image for testing OS Deployment.This Golden Image includes a UEFI System Partition and a GRUB loader having a simple configuration to show a message on the server console at boot.



Deployment Plans:

	        Name: HPE - Support 1.0 - simple deployment test-2017-03-24 (Type:OEDeploymentPlan)
	Description: Simple deployment using UEFI test image
	GoldenImage: HPE - Support 1.0 - UEFI Test Image - 2016-03-24


	        Name: HPE - Support 1.0 - network deployment test-2017-03-24 (Type:OEDeploymentPlan)
	Description: Simple deployment with NIC attributes using UEFI test image
	GoldenImage: HPE - Support 1.0 - UEFI Test Image - 2016-03-24



Build Plans:

	       Name: HPE - Support 1.0 - simple test deployment (UEFI) - 2017-03-24 (Type:deploy)
	Description: Simple deployment using UEFI test image


	       Name: HPE - Support 1.0 - network test deployment (UEFI) - 2017-03-24 (Type:deploy)
	Description: Simple deployment with NIC attributes using UEFI test image



Plan Scripts:

	       Name: HPE - Support 1.0 - network example UEFI personalization script - 2017-03-24 (deploy)
	   FullName: 16f85627-513e-4d30-8829-5e42e6dcc7f1_planscript.json
	Description: Example personalization script for example UEFI Golden Image. This script changes the loader message to include personalization settings from the OS deployment.


	       Name: HPE - Support 1.0 - simple example UEFI personalization script - 2017-03-24 (deploy)
	   FullName: ce3a0e71-617c-4c61-bb1d-643ed76994ac_planscript.json
	Description: Example personalization script for example UEFI Golden Image. This script changes the loader message to include personalization settings from the OS deployment.


	       Name: HPE - Support 1.0 - example UEFI generalization script - 2017-03-24 (capture)
	   FullName: ed9c1ce9-e8cf-4b06-97d5-bdf2b1ca2b60_planscript.json
	Description: Example generalization script for example UEFI Golden Image. This script changes the loader message to remove personalization settings from the Golden Image being created.



