$ServiceRepos = @(
"Services.Course", 
"Services.Section",
"Services.Assessment", 
"Services.Account", 
"Services.RulesEngine", 
"LearningRecordStore", 
"Services.Analytics",
"Services.SystemTests",
"Services.Tenant",
"Services.Search", 
"Services.Email", 
"Common", 
"Services.SIS", 
"Services.Asset", 
"Services.Calendar", 
"Services.Batch", 
"Services.Cors", 
"Services.Meahtype", 
"Services.SignalR", 
"Services.CSharpClient", 
"Architectual-Artifacts", 
"Services.Discussion", 
"DeveloperSite", 
"NewRelicAgents", 
"DataServices.DataExtract"
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
