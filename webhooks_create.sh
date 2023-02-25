#!/bin/bash
# set -o xtrace

echo "*** Create Webhooks"

project_name='fernandomatsuosantos'
pat='gb3ttyhhnmvkt76qr7w5khdkgymlgii5k75x2p2wvh77th4vu4ra'

# json read
json_area_path='DevOps PoC'
json_project_id='947e6c00-40b5-47ed-8325-8dd36a6029dc'
webhooks=$(cat webhooks_test.json)
webhooks="${webhooks//_var_area_path_/${json_area_path}}"
webhooks="${webhooks//_var_project_id_/${json_project_id}}"

for row in $(echo "${webhooks}" | jq -r '.[] | @base64'); do
    json=$(echo ${row} | base64 --decode)
    curl -X POST "https://dev.azure.com/${project_name}/_apis/hooks/subscriptions?api-version=6.0" -H "Authorization: Basic $(echo -n "":${pat}"" | base64)" -H 'Content-Type: application/json' -d "$json"
done

