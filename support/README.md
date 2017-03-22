support - Artifacts to validate installation and operation of HPE Image Streamer. This include a very small golden image which just contains a GRUB boot loader. Artifacts for this simple image alow customizable parameters to be set which can be validated in the boot loader display of a deployed HPE Synergy Compute Module.

#Artifact Bundle Contents
--------------------------------------------------------------------------------
         File name: HPE-Support-Artifacts-2017-03-15.zip
         Name (in manifest): HPE-Support-Artifacts-2017-03-15
       Description: Artifacts to verify Image Streamer installation and configuration
             Dated: 2017-03-15 (16:35:25)
--------------------------------------------------------------------------------

Golden Images:

	        Name: HPE - Support 1.0 - UEFI Test Image - 2016-11-17
	Description: HPE Golden Image for testing OS Deployment.This Golden Image includes a UEFI System Partition and a GRUB loader having a simple configuration to show a message on the server console at boot.



Deployment Plans:

	        Name: HPE - Support 1.0 - simple deployment test-2017-03-15 (Type:OEDeploymentPlan)
	GoldenImage: HPE - Support 1.0 - UEFI Test Image - 2016-11-17


	        Name: HPE - Support 1.0 - network deployment test-2017-03-15 (Type:OEDeploymentPlan)
	GoldenImage: HPE - Support 1.0 - UEFI Test Image - 2016-11-17



Build Plans:

	       Name: HPE - Support 1.0 - simple test deployment (UEFI) - 2017-03-15 (Type:deploy)
	Description: HPE - Support 1.0 - simple test deployment (UEFI) - 207-03-15


	       Name: HPE - Support 1.0 - network test deployment (UEFI) - 2017-03-15 (Type:deploy)
	Description: HPE - Support 1.0 - network test deployment (UEFI) - 2017-03-15



Plan Scripts:

	       Name: HPE - Support 1.0 - network example UEFI personalization script - 2017-03-15 (deploy)
	   FullName: 16f85627-513e-4d30-8829-5e42e6dcc7f1_planscript.json
	Description: Example personalization script for example UEFI Golden Image. This script changes the loader message to include personalization settings from the OS deployment.


	       Name: HPE - Support 1.0 - simple example UEFI personalization script - 2017-03-15 (deploy)
	   FullName: ce3a0e71-617c-4c61-bb1d-643ed76994ac_planscript.json
	Description: Example personalization script for example UEFI Golden Image. This script changes the loader message to include personalization settings from the OS deployment.


	       Name: HPE - Support 1.0 - example UEFI generalization script - 2017-03-15 (capture)
	   FullName: ed9c1ce9-e8cf-4b06-97d5-bdf2b1ca2b60_planscript.json
	Description: Example generalization script for example UEFI Golden Image. This script changes the loader message to remove personalization settings from the Golden Image being created.


