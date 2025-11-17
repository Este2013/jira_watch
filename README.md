# jira_watch

A Jira client that shows the most recent updates done in projects you work on.

# TODO

 - mac support
 - clicking image in desc should bring it up

 - add custom fields
 - Comments
   - nested replies
   - show in history
 - History: show "ticket creation" item


## PRIORIZATION

### EASY, IMPORTANT
 
 - refresh (per few minutes)
 - improve Login page in settings dialog

### TOUGH, IMPORTANT
 - Filters:
   - ticket type filter ( bugs, features req, stories, epics etc. )
   - Assignee filter
   - Creator filter
   - Type filter (bug, feat.)

### EASY, nice
 - assing ticket to me
 - copy comment links
 - custom categories

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
 - if a ticket is selected and a refresh occurs, the selected ticket does not update on right side 
 - Emojis are not rendered in comments (there is no Atlassian API for that)
 - Comments: nested replies are not shown as nested

# Furthemore
- GitLab view
- 