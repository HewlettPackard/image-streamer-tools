#Artifact Bundle Contents

--------------------------------------------------------------------------------
         File name: HPE-ImageStreamer-Developer-2017-03-17.zip
         Name (in manifest): HPE-ImageStreamer-Developer-2017-03-17
       Description: Empty Description
             Dated: 2017-03-17 (20:12:15)
--------------------------------------------------------------------------------

Golden Images:

	        Name: HPE - Developer 1.0 - UEFI Test Image - v1.00
	Description: HPE Golden Image for testing OS Deployment. This Golden Image includes a UEFI System Partition and a GRUB loader having a simple configuration to show a message on the server console at boot.



Deployment Plans:

	        Name: HPE - Developer 1.0 - Deployment Test (UEFI) - 2017-03-17 (Type:OEDeploymentPlan)
	GoldenImage: HPE - Developer 1.0 - UEFI Test Image - v1.00


	        Name: User - Developer 1.0 - Deployment Test (UEFI) (Type:OEDeploymentPlan)
	GoldenImage: HPE - Developer 1.0 - UEFI Test Image - v1.00



Build Plans:

	       Name: HPE - Developer 1.0 - example UEFI capture - 2017-03-17 (Type:capture)


	       Name: HPE - Developer 1.0 - example UEFI deploy - 2017-03-17 (Type:deploy)


	       Name: User - Developer 1.0 - example UEFI capture - 2017-03-17 (Type:capture)


	       Name: User - Developer 1.0 - example UEFI deploy - 2017-03-17 (Type:deploy)


	       Name: HPE - Developer 1.0 - example attribute types - 2017-03-17 (Type:deploy)



Plan Scripts:

	       Name: HPE - Foundation 1.0 - create empty OS Volume - 2017-03-17 (deploy)
	   FullName: 0a2c18d2-6ca3-4111-9a0a-c96677e10300_planscript.json
	Description: Create an empty OS Volume to be used as the target for OS install. After OS install, the OS Volume may be used to capture a new Golden Image.


	       Name: HPE - Developer 1.0 - attempt or fail deployment - 2017-03-17 (deploy)
	   FullName: 6f0f67e7-8def-4b28-bf55-387058883221_planscript.json
	Description: Attempt or intentionally fail OS deployment. Intentionally failing deployment is useful to aid rapid development of artifacts.


	       Name: User - Developer 1.0 - example UEFI generalization script - 2017-03-17 (capture)
	   FullName: 839f8822-9087-4c3f-be93-8704b2e97fd7_planscript.json
	Description: Example generalization script for example UEFI Golden Image. This script changes the loader message to remove personalization settings from the Golden Image being created.


	       Name: HPE - Developer 1.0 - example UEFI personalization script - 2017-03-17 (deploy)
	   FullName: 9a8f6672-ba35-4378-9f2c-e241b5be916c_planscript.json
	Description: Example personalization script for example UEFI Golden Image. This script changes the loader message to include personalization settings from the OS deployment.


	       Name: HPE - Developer 1.0 - example UEFI generalization script - 2017-03-17 (capture)
	   FullName: 9de8c9e1-42ca-43f4-8930-aedc272b0cf4_planscript.json
	Description: Example generalization script for example UEFI Golden Image. This script changes the loader message to remove personalization settings from the Golden Image being created.


	       Name: HPE - Developer 1.0 - add example messages to log - 2017-03-17 (deploy)
	   FullName: a7ea4efd-8f7d-4ea8-b788-847f29d7438e_planscript.json
	Description: Add a example messages to the Image Streamer OS deployment log.


	       Name: User -  Developer 1.0 - example UEFI personalization script - 2017-03-17 (deploy)
	   FullName: c80feb3d-bbff-4a70-ac02-56dc07910e3e_planscript.json
	Description: Example personalization script for example UEFI Golden Image. This script changes the loader message to include personalization settings from the OS deployment.




