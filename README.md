# jira_watch

A new Flutter project.

# TODO
 - indicate the selected tkt in the list
 - View ticket (not edit)
   - Def. fields
   - Also custom fields
 - Comments
   - 🏃‍♂️View tkt comments 
     - TODO IMPROVE AdfRenderer
   - make sure they appear as updates
     - 🐞They are counted in the update sort, but dont actually appear in the history
 - ticket status
 - Filters:
   - ticket status filter ( bugs features req, stories, epics etc. )
   - Assignee filter
   - Creator filter
   - Type filter (bug, feat.)



## PRIO

### CRITICAL

### EASY, IMPORTANT
 - refresh (per few minutes)
 - improve Login page in settings dialog

### TOUGH, IMPORTANT
 - mark update as read
 - flag tkts for meetings


### EASY, nice
 - assing ticket to me

### TOUGH, nice
 - local favorites (hold a ticket always on top)
 - control ticket status
   - UI/UX make ticket drag and dropable in certain statuses ( e.g In progress, Done , etc)
 - Reverse update sorting
 - Linked test cases and builds (Jira integrations) 
   - test coverage overview
 - custom filters
 - comments
 - hide tickets
 - [OPT] Websocket exposition for SD plugin
   - stats
   - new tickets, updates...
 - Tree graph 
 - Similarity detection view (via [cosine similarity](https://en.wikipedia.org/wiki/Cosine_similarity))
 - add to [MS TODO](https://support.microsoft.com/en-au/office/using-microsoft-to-do-s-api-f944256d-3b08-4945-ba69-2c17afeb60b4#:~:text=Microsoft%20To%20Do%20uses%20Exchange,API%20reference%20(version%202.0))

## BUGS
 - if project filters are changed before request completes, the newer request is not taken into account

# Furthemore
 - GitLab view



# DEV DOCUMENTATION

## How to publish a release 
### Windows
 - In pubspec.yaml, update **both appversion and msix version**
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