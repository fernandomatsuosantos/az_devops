#!/bin/bash
# set -o xtrace

echo "*** Create Webhooks"

read -p 'PAT:' pat

organization_name="fernandomatsuosantos"
project_name="DevOps PoC"
area_path="DevOps PoC"

# Get Project ID
url="https://dev.azure.com/$organization_name/_apis/projects/$project_name?api-version=7.0"
url="${url// /%20}"
project_json=$(curl -X GET $url -H "Authorization: Basic $(echo -n "":${pat}"" | base64)")
project_id=$(echo ${project_json} | jq '.id')


work_item_name="Effort"
work_feature_name="Feature"
work_epic_name="Epic"

field_parent_name="Parent"
field_effort_name="Effort"
field_iteration_id_name="Iteration ID"
field_start_date_name="Start Date"
field_target_date_name="Target Date"
field_state_name="State"
field_completed_effort_name="Completed Effort"

# json read
webhooks=$(cat webhooks.json)
webhooks="${webhooks//_var_area_path_/${area_path}}"
webhooks="${webhooks//_var_project_id_/${project_id}}"
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

webhooks="${webhooks//_organization_name_/${organization_name}}"


for row in $(echo "${webhooks}" | jq -r '.[] | @base64'); do
    json=$(echo ${row} | base64 --decode)
    curl -X POST "https://dev.azure.com/${organization_name}/_apis/hooks/subscriptions?api-version=6.0" -H "Authorization: Basic $(echo -n "":${pat}"" | base64)" -H 'Content-Type: application/json' -d "$json"
done

