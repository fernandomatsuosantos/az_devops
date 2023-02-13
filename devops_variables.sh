#!/bin/bash

echo '$(bash_variables)' > bash_variables.sh
cat bash_variables.sh
chmod +x bash_variables.sh
./bash_variables.sh

# backlog_item_name="Product Backlog Item"
# feature_name="Feature"
# epic_name="Epic"
# state_done_name="Done"
# effort_name="Effort"
# parent_id_name="ParentId"
# completed_effort_name="CompletedEffort"
# percentage_completed_effort_name="PercentageCompletedEffort"
# time_zone="Z"

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
