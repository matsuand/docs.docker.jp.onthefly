%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Audit log
keywords: Team, organization, activity, log, audit, activities
title: Audit log
---
@y
---
description: Audit log
keywords: Team, organization, activity, log, audit, activities
title: Audit log
---
@z

@x
> The Audit log feature is available for users subscribed to a Team plan. [Upgrade](https://www.docker.com/pricing){: target="_blank" rel="noopener" class="_"} your existing account to a Team account to start using the Audit log feature.
@y
> The Audit log feature is available for users subscribed to a Team plan. [Upgrade](https://www.docker.com/pricing){: target="_blank" rel="noopener" class="_"} your existing account to a Team account to start using the Audit log feature.
@z

@x
Audit log displays a chronological list of activities that occur at organization and repository levels. It provides owners of Docker Team accounts a report of all their team member activities. This allows the team owners to view and track what changes were made, the date when a change was made, and who initiated the change. For example, the Audit log displays activities such as the date when a repository was created or deleted, the team member who created the repository, the name of the repository, and when there was a change to the privacy settings.
@y
Audit log displays a chronological list of activities that occur at organization and repository levels. It provides owners of Docker Team accounts a report of all their team member activities. This allows the team owners to view and track what changes were made, the date when a change was made, and who initiated the change. For example, the Audit log displays activities such as the date when a repository was created or deleted, the team member who created the repository, the name of the repository, and when there was a change to the privacy settings.
@z

@x
Team owners can also see the Audit log for their repository if the repository is part of the organization subscribed to a Docker Team plan.
@y
Team owners can also see the Audit log for their repository if the repository is part of the organization subscribed to a Docker Team plan.
@z

@x
## View the Audit log
@y
## View the Audit log
@z

@x
To view the Audit log:
@y
To view the Audit log:
@z

@x
1. Sign into an owner account for the organization in Docker Hub.
2. Select your organization from the list and then click on the **Activity** tab.
@y
1. Sign into an owner account for the organization in Docker Hub.
2. Select your organization from the list and then click on the **Activity** tab.
@z

@x
    ![Organization activity tab](images/org-activity-tab.png){:width="700px"}
@y
    ![Organization activity tab](images/org-activity-tab.png){:width="700px"}
@z

@x
The Audit log begins tracking activities from the date the feature is live, that is from **25 January 2021**. Activities that took place before this date are not captured.
@y
The Audit log begins tracking activities from the date the feature is live, that is from **25 January 2021**. Activities that took place before this date are not captured.
@z

@x
> **Note**
>
> Docker will retain the Audit log activity data for a period of six months.
@y
> **Note**
>
> Docker will retain the Audit log activity data for a period of six months.
@z

@x
## Customize the Audit log
@y
## Customize the Audit log
@z

@x
By default, all activities that occur at organization and repository levels are displayed on the **Activity** tab. Use the calendar option to select a date range and customize your results. After you have selected a date range, the **Activity** tab displays the Audit log of all the activities that occurred during that period.
@y
By default, all activities that occur at organization and repository levels are displayed on the **Activity** tab. Use the calendar option to select a date range and customize your results. After you have selected a date range, the **Activity** tab displays the Audit log of all the activities that occurred during that period.
@z

@x
![Activities list](images/activity-list.png){:width="600px"}
@y
![Activities list](images/activity-list.png){:width="600px"}
@z

@x
<br />
@y
<br />
@z

@x
> **Note**
>
> Activities created by the Docker Support team as part of resolving customer issues appear in the Audit log as **dockersupport**.
@y
> **Note**
>
> Activities created by the Docker Support team as part of resolving customer issues appear in the Audit log as **dockersupport**.
@z

@x
<br />
@y
<br />
@z

@x
Click the **All Activities** drop-down list to view activities that are specific to an organization or a repository. After choosing **Organization** or **Repository**, you can further refine the results using the **All Actions** drop-down list. If you select the **Activities** tab from the **Repository** view, you can only filter repository-level activities.
@y
Click the **All Activities** drop-down list to view activities that are specific to an organization or a repository. After choosing **Organization** or **Repository**, you can further refine the results using the **All Actions** drop-down list. If you select the **Activities** tab from the **Repository** view, you can only filter repository-level activities.
@z

@x
![Refine org activities](images/org-all-actions.png){:width="600px"}
@y
![Refine org activities](images/org-all-actions.png){:width="600px"}
@z

@x
## Audit log event definitions
@y
## Audit log event definitions
@z

@x
Refer to the following section for a list of events and their descriptions:
@y
Refer to the following section for a list of events and their descriptions:
@z

@x
### Organization events
@y
### Organization events
@z

@x
| Event                                                          | Description                                   |
|:------------------------------------------------------------------|:------------------------------------------------|
| Team Created | Activities related to the creation of a team     |
| Team Deleted | Activities related to the deletion of a team |
| Team Member Added | Details of the member added to your team |
| Team Member Removed | Details of the member removed from your team |
| Team Member Invited | Details of the member invited to your team |
| Organization Member Removed | Details about member removed from your organization |
|  Organization Created| Activities related to the creation of a new organization |
@y
| Event                                                          | Description                                   |
|:------------------------------------------------------------------|:------------------------------------------------|
| Team Created | Activities related to the creation of a team     |
| Team Deleted | Activities related to the deletion of a team |
| Team Member Added | Details of the member added to your team |
| Team Member Removed | Details of the member removed from your team |
| Team Member Invited | Details of the member invited to your team |
| Organization Member Removed | Details about member removed from your organization |
|  Organization Created| Activities related to the creation of a new organization |
@z

@x
### Repository events
@y
### Repository events
@z

@x
| Event                                                          | Description                                   |
|:------------------------------------------------------------------|:------------------------------------------------|
| Repository Created | Activities related to the creation of a new repository |
| Repository Deleted | Activities related to the deletion of a repository |
| Privacy Changed | Details related to the privacy policies that were updated |
| Tag Pushed | Activities related to the tags pushed |
| Tag Deleted | Activities related to the tags deleted |
@y
| Event                                                          | Description                                   |
|:------------------------------------------------------------------|:------------------------------------------------|
| Repository Created | Activities related to the creation of a new repository |
| Repository Deleted | Activities related to the deletion of a repository |
| Privacy Changed | Details related to the privacy policies that were updated |
| Tag Pushed | Activities related to the tags pushed |
| Tag Deleted | Activities related to the tags deleted |
@z
