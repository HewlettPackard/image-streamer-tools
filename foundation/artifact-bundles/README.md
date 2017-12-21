# Foundation artifact bundle for ImageStreamer v4.0 release

## Note: 
- All artifact bundles in this repo are compatible with ImageStreamer v4.0 release
- Click on 'Branch:' drop down menu on this page to get artifact bundles for other ImageStreamer releases

## Version history

HPE-Foundation-Artifacts-2017-10-13-v3.0.zip
 - Defect fixes
 
HPE-Foundation-Artifacts-2017-07-19-v3.0.zip
 - Bug fixes
 
HPE-Foundation-Artifacts-2017-03-24.zip
  - Initial version

## Artifact Bundle Contents

--------------------------------------------------------------------------------

	            File name: HPE-Foundation-Artifacts-2017-10-13-v3.0.zip
		Name (in manifest): HPE-Foundation-Artifacts-2017-10-13-v3.0
		       Description: Artifacts to demonstrate basic Image Streamer functionalities. 
		             Dated: 2017-10-13 (05:20:59)

--------------------------------------------------------------------------------

Deployment Plans:

	        Name: HPE - Foundation 1.0 - create empty OS Volume-2017-10-13 (Type:OEDeploymentPlan)
	 Description: Create an empty OS Volume to be the target for OS install. 


Build Plans:

	       Name: HPE - Foundation 1.0 - capture OS Volume as is-2017-03-24 (Type:capture)
	Description: Capture OS Volume as is - version 1.00 Create a new Golden Image from an OS Volume with no generalization changes to the OS Volume content.

	       Name: HPE - Foundation 1.0 - create empty OS Volume-2017-10-13 (Type:deploy)
	Description: Create empty OS Volume version 1.00 Create an empty OS Volume to be the target for OS install.

	       Name: HPE - Foundation 1.0 - deploy Golden Image as is - 2017-07-19 (Type:deploy)
	Description: Deploy Golden Image as is with no personalization changes to the OS Volume.


Plan Scripts:

	       Name: HPE - Foundation 1.0 - fail OS deployment-2017-03-24 (deploy)
	   FullName: 0a3d4931-1715-4210-ad23-54212a2a6c51_planscript.json
	Description: Fail OS deployment - version 1.00 
	             Cause OS deployment to fail.


	       Name: HPE - Foundation 1.0 - create empty OS Volume - 2017-03-24 (deploy)
	   FullName: ca5cb794-86bc-43db-9347-3619c5aa830b_planscript.json
	Description: Create an empty OS Volume to be used as the target for OS install. After OS install, the OS Volume may be used to capture a new Golden Image.

