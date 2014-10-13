$ServiceRepos = @(
"MobileApps_Thuze-for-iOS", 
"Reporting.Telerik", 
"MobileApps_Parabola-for-Android", 
"MobileApps_Talon-for-iOS", 
"MobileApps_UI-Automation", 
"LearningStreak",
"MobileApps_Talon-for-Android",
"MobileApps_Constellation-for-iOS",
"MobileApps_Constellation-for-Android"
)

foreach ($service in $ServiceRepos) {
	$found = $FALSE
	foreach ($folder in Get-ChildItem -Directory -Path c:\github_com) {
	 	if ($folder.Name -eq $service) {
	 		$found = $TRUE
	 		cd $service
	 		git checkout .
	 		git pull
	 		cd ..
	 	} 
	 }
 	if (!$found) {
 		$git = "git@github.com:BridgepointEducationProducts/"+$service + ".git"
 		git clone $git
 	}
}
