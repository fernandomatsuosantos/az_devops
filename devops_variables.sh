#!/bin/bash

az devops configure --defaults "organization=$ORGANIZATION"

# Azure Library converts variables to uppercase

backlog_item_name="$BACKLOG_ITEM_NAME"
feature_name="$FEATURE_NAME"
epic_name="$EPIC_NAME"
state_done_name="$STATE_DONE_NAME"
effort_name="$EFFORT_NAME"
parent_id_name="$PARENT_ID_NAME"
completed_effort_name="$COMPLETED_EFFORT_NAME"
percentage_completed_effort_name="$PERCENTAGE_COMPLETED_EFFORT_NAME"
time_zone="$TIME_ZONE"

echo $STATES

states_enabled="$STATES_ENABLED"
states="$STATES"
states_not_started=$(echo $states | jq --arg project_name "$project_name" -r '.[] | select(.project==$project_name) | .states_not_started')
states_not_started_set_status=$(echo $states | jq --arg project_name "$project_name" -r '.[] | select(.project==$project_name) | .states_not_started_set_status')
states_in_development=$(echo $states | jq --arg project_name "$project_name" -r '.[] | select(.project==$project_name) | .states_in_development')
states_in_development_set_status=$(echo $states | jq --arg project_name "$project_name" -r '.[] | select(.project==$project_name) | .states_in_development_set_status')
states_resolved=$(echo $states | jq --arg project_name "$project_name" -r '.[] | select(.project==$project_name) | .states_resolved')
states_resolved_set_status=$(echo $states | jq --arg project_name "$project_name" -r '.[] | select(.project==$project_name) | .states_resolved_set_status')
states_closed=$(echo $states | jq --arg project_name "$project_name" -r '.[] | select(.project==$project_name) | .states_closed')
states_closed_set_status=$(echo $states | jq --arg project_name "$project_name" -r '.[] | select(.project==$project_name) | .states_closed_set_status')
states_blocked=$(echo $states | jq --arg project_name "$project_name" -r '.[] | select(.project==$project_name) | .states_blocked')
states_blocked_set_status=$(echo $states | jq --arg project_name "$project_name" -r '.[] | select(.project==$project_name) | .states_blocked_set_status')

# Variables example

# backlog_item_name="Product Backlog Item"
# feature_name="Feature"
# epic_name="Epic"
# state_done_name="Done"
# effort_name="Effort"
# parent_id_name="ParentId"
# completed_effort_name="CompletedEffort"
# percentage_completed_effort_name="PercentageCompletedEffort"
# time_zone="Z"

# States check file states.json

# states_not_started=("New" "Approved")
# states_not_started_set_status="New"
# states_in_development=("Committed")
# states_in_development_set_status="In Progress"
# states_resolved=("Ready for QA" "QA Done")
# states_resolved_set_status="Resolved"
# states_closed=("Done")
# states_closed_set_status="Done"
# states_blocked=("Removed")
# states_blocked_set_status=("Removed")
