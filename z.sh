#!/bin/bash

backlog_iteration_path='DevOps PoC\\Q 23.1\\Sprint 23.1.3'
echo $backlog_iteration_path


res="${backlog_iteration_path//[^\\]}"
echo "${#res}"