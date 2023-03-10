#!/bin/bash

state_final_id=5

echo ${state_final_id}

if [[ ${state_final_id} == "1" ]]; then
    state_final="${states_1_one_set_status}"
elif [[ ${state_final_id} == "2" ]]; then
    state_final="${states_2_one_set_status}"
elif [[ ${state_final_id} == "3" ]]; then
    state_final="${states_3_one_set_status}"
elif [[ ${state_final_id} == "4" ]]; then
    state_final="${states_4_one_set_status}"
elif [[ ${state_final_id} == 51 ]]; then
    state_final=121212
fi

echo ${state_final}