# jira_watch

A new Flutter project.


# TODO 


## PRIO


### CRITICAL
### Base features

### EASY, IMPORTANT
 - refresh (per few minutes, or manually)
 - improve Login page in settings dialog

### TOUGH, IMPORTANT
 - mark update as read
 - ticket status
 - flag tkts for meetings

### EASY, nice
 - assing ticket to me

### TOUGH, nice
 - local favorites (hold a ticket always on top)
 - control ticket status
   - UI/UX make ticket drag and dropable in certain statuses ( e.g In progress, Done , etc)
 - ticket status filter ( bugs features req, stories, epics etc. )
 - comments
 - hide tickets

## BUGS
 - if project filters are changed before request completes, the newer request is not taken into account





# DEV DOCUMENTATION

## How to pubish a release 
### Windows
 - Build an installer by running `dart run msix:create`
 - Create a jira_watcher.appinstaller file on the template:
``` XML
<!-- Bump BOTH version attributes every release. -->
<!-- Bump BOTH version attributes every release. -->
<!-- Bump BOTH version attributes every release. -->
<!-- Bump BOTH version attributes every release. -->
<?xml version="1.0" encoding="UTF-8"?>
<AppInstaller
  xmlns="http://schemas.microsoft.com/appx/appinstaller/2018"
  Uri="https://este2013.github.io/jira_watch/jira_watcher.appinstaller"
 
  Version="1.2.3.0"> 

  <MainPackage
    Name="com.example.myapp"
    Publisher="CN=Your Company"
    Version="1.2.3.0"
    Uri="https://este2013.github.io/jira_watch/VERSION/MSIX FILE.msix" />

  <UpdateSettings>
    <!-- Check every 24h on app launch; prompt user -->
    <OnLaunch HoursBetweenUpdateChecks="24" ShowPrompt="true" UpdateBlocksActivation="false" />
    <!-- Or replace the line above with this for silent background checks: -->
    <!-- <AutomaticBackgroundTask /> -->
  </UpdateSettings>
</AppInstaller>
```
 - Then publish the installer .msix file to the `gh-pages` branch
 - And add the files to GitHub releases