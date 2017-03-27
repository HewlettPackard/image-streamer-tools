# Artifact Bundle Contents

--------------------------------------------------------------------------------
         File name: HPE-Foundation-Artifacts-2017-03-24.zip
         Name (in manifest): HPE-Foundation-Artifacts-2017-03-24
         Description: Artifacts to demonstrate basic Image Streamer functionalities
         Dated: 2017-03-25 (05:24:25)
--------------------------------------------------------------------------------

Deployment Plans:

	        Name: HPE - Foundation 1.0 - create empty OS Volume-2017-03-24 (Type:OEDeploymentPlan)
	 Description: Create an empty OS Volume to be the target for OS install. 


Build Plans:

	       Name: HPE - Foundation 1.0 - create empty OS Volume-2017-03-24 (Type:deploy)
	Description: Create empty OS Volume version 1.00 Create an empty OS Volume to be the target for OS install.

	       Name: HPE - Foundation 1.0 - capture OS Volume as is-2017-03-24 (Type:capture)
	Description: Capture OS Volume as is - version 1.00 Create a new Golden Image from an OS Volume with no generalization changes to the OS Volume content.

	       Name: HPE - Foundation 1.0 - deploy Golden Image as is-2017-03-24 (Type:capture)
	Description: Create a new Golden Image from an OS Volume with no generalization changes to the OS Volume content.


Plan Scripts:

	       Name: HPE - Foundation 1.0 - create empty OS Volume - 2017-03-24 (deploy)
	   FullName: 123444ab-ca50-45fc-ab6b-0fc9fcb638b0_planscript.json
	Description: Create an empty OS Volume to be used as the target for OS install. After OS install, the OS Volume may be used to capture a new Golden Image.


	       Name: HPE - Foundation 1.0 - fail OS deployment-2017-03-24 (deploy)
	   FullName: f5575a71-5f41-449c-8d3f-a9260cc9eaa3_planscript.json
	Description: Fail OS deployment - version 1.00 
	             Cause OS deployment to fail.

