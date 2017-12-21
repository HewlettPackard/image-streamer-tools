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


# Artifact Bundle Contents

--------------------------------------------------------------------------------

	            File name: HPE-Support-Artifacts-2017-11-29-v4.0.zip
		Name (in manifest): HPE-Support-Artifacts-2017-11-29-v4.0
		       Description: Artifacts to verify Image Streamer installation and configuration. 
		             Dated: 2017-11-29 (19:25:35)

--------------------------------------------------------------------------------

Golden Images:

	        Name: HPE - Support 1.0 - UEFI Test Image - 2017-03-24
	Description: HPE Golden Image for testing OS Deployment. This Golden Image includes a UEFI System Partition and a GRUB loader having a simple configuration to show a message on the server console at boot. 



Deployment Plans:

	        Name: HPE - Support 1.0 - network deployment test-2017-11-29 (Type:OEDeploymentPlan)
	 Description: (c) Copyright 2017 Hewlett Packard Enterprise Development LP. Licensed under the Apache License, Version 2.0 (the "License");you may not use this file except in compliance with the License.
	GoldenImage: HPE - Support 1.0 - UEFI Test Image - 2017-03-24


	        Name: HPE - Support 1.0 - simple deployment test-2017-11-29 (Type:OEDeploymentPlan)
	 Description: (c) Copyright 2017 Hewlett Packard Enterprise Development LP. Licensed under the Apache License, Version 2.0 (the "License");you may not use this file except in compliance with the License.
	GoldenImage: HPE - Support 1.0 - UEFI Test Image - 2017-03-24


Build Plans:

	       Name: HPE - Support 1.0 - simple test deployment (UEFI) - 2017-11-29 (Type:deploy)
	Description: HPE - Support 1.0 - simple test deployment (UEFI) - 2017-03-24 (c) Copyright 2017 Hewlett Packard Enterprise Development LP. Licensed under the Apache License, Version 2.0 (the "License");you may not use this file except in compliance.


	       Name: HPE - Support 1.0 - network test deployment (UEFI) - 2017-11-29 (Type:deploy)
	Description: HPE - Support 1.0 - network test deployment (UEFI) - 2017-03-24 (c) Copyright 2017 Hewlett Packard Enterprise Development LP. Licensed under the Apache License, Version 2.0 (the "License");you may not use this file except in compliance;...



Plan Scripts:

	       Name: HPE - Support 1.0 - network example UEFI personalization script - 2017-08-28 (deploy)
	   FullName: 481ff65a-e41f-4540-8846-a59761d10674_planscript.json
	Description: Example personalization script for example UEFI Golden Image. This script changes the loader message to include personalization settings from the OS deployment.


	       Name: HPE - Support 1.0 - example UEFI generalization script - 2017-03-24 (capture)
	   FullName: 8ed978e1-317e-4548-ba10-da93d4c905bc_planscript.json
	Description: Example generalization script for example UEFI Golden Image. This script changes the loader message to remove personalization settings from the Golden Image being created.


	       Name: HPE - Support 1.0 - simple example UEFI personalization script - 2017-03-24 (deploy)
	   FullName: ea0e6e28-6c0a-468a-abdc-b8098928b34b_planscript.json
	Description: Example personalization script for example UEFI Golden Image. This script changes the loader message to include personalization settings from the OS deployment.





