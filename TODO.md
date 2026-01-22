# TODO 

 - ✅ add blockCard to the ADF parser
 - add checkbox to the ADF parser

## UNSORTED

NOTES:
 - Timeline
 - Nested tasks

## PRIORIZATION

### EASY, IMPORTANT
 
 - refresh (per few minutes)

### TOUGH, IMPORTANT
 - add custom fields
 - Filters:
   - workItem type filter ( bugs, features req, stories, epics etc. )
   - Assignee filter
   - Creator filter
   - Type filter (bug, feat.)

### EASY, nice
 - assing workItem to me
 - copy comment links
 - custom categories

### TOUGH, nice
 - local favorites (hold a workItem always on top)
 - control workItem status
   - UI/UX make workItem drag and dropable in certain statuses ( e.g In progress, Done , etc)
 - Reverse update sorting
 - custom filters
 - hide workItems
 - Tree graph 
 - Comments
   - nested replies
   - show in history

# Long term ideas
 - GitLab and Qase views
    - Linked test cases and builds (Jira integrations) 
    - test coverage overview
 - Websocket exposition for SD plugin
    - stats
    - new workItems, updates...
 - Dupe finder / Similarity detection (via [cosine similarity](https://en.wikipedia.org/wiki/Cosine_similarity))
 - [MS TODO](https://support.microsoft.com/en-au/office/using-microsoft-to-do-s-api-f944256d-3b08-4945-ba69-2c17afeb60b4#:~:text=Microsoft%20To%20Do%20uses%20Exchange,API%20reference%20(version%202.0)) ntegration


## BUGS
 - if project filters are changed before request completes, the newer request is not taken into account
 - if a workItem is selected and a refresh occurs, the selected workItem does not update on right side 
 - Emojis are not rendered in comments (there is no Atlassian API for that)
 - Comments: nested replies are not shown as nested
 - Jira attachments in description (ex: application/json) is given to the JiraImage widget, instead of building a dedicated widget for non-image types => ```// TODO FIX #json&ips```
 - macOS: Advanced tab is unable to open any of the folders shown
