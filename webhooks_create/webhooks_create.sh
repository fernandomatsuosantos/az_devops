#!/bin/bash
# set -o xtrace

echo "*** Create Webhooks"

read -p 'Project Name:' project_name
read -p 'PAT:' pat

read -p 'Area Path:' json_area_path
read -p 'Project ID:' json_project_id

# work_item_name="Product Backlog Item"
# work_feature_name="Feature"
# work_epic_name="Epic"

# field_parent_name="Parent"
# field_effort_name="Effort"
# field_iteration_id_name="Iteration ID"
# field_start_date_name="Start Date"
# field_target_date_name="Target Date"
# field_state_name="State"
# field_completed_effort_name="Completed Effort"

read -p 'Item Name:' work_item_name
read -p 'Feature Name:' work_feature_name
read -p 'Epic Name:' work_epic_name

read -p 'Field Parent Name:' field_parent_name
read -p 'Field Effort Name:' field_effort_name
read -p 'Field Iteration ID Name:' field_iteration_id_name
read -p 'Field Start Date Name:' field_start_date_name
read -p 'Field Target Date Name:' field_target_date_name
read -p 'Field State Name:' field_state_name
read -p 'Field Completed Effort Name:' field_completed_effort_name

# json read
webhooks=$(cat webhooks.json)
webhooks="${webhooks//_var_area_path_/${json_area_path}}"
webhooks="${webhooks//_var_project_id_/${json_project_id}}"
webhooks="${webhooks//_work_item_name_/${work_item_name}}"
webhooks="${webhooks//_work_feature_name_/${work_feature_name}}"
webhooks="${webhooks//_work_epic_name_/${work_epic_name}}"

webhooks="${webhooks//_field_parent_name_/${field_parent_name}}"
webhooks="${webhooks//_field_effort_name_/${field_effort_name}}"
webhooks="${webhooks//_field_iteration_id_name_/${field_iteration_id_name}}"
webhooks="${webhooks//_field_start_date_name_/${field_start_date_name}}"
webhooks="${webhooks//_field_target_date_name_/${field_target_date_name}}"
webhooks="${webhooks//_field_state_name_/${field_state_name}}"
webhooks="${webhooks//_field_completed_effort_name_/${field_completed_effort_name}}"

for row in $(echo "${webhooks}" | jq -r '.[] | @base64'); do
    json=$(echo ${row} | base64 --decode)
    curl -X POST "https://dev.azure.com/${project_name}/_apis/hooks/subscriptions?api-version=6.0" -H "Authorization: Basic $(echo -n "":${pat}"" | base64)" -H 'Content-Type: application/json' -d "$json"
done

