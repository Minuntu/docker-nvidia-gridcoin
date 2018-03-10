#!/bin/bash
# wait for boinc to start
sleep 15

# login
boinccmd --join_acct_mgr ${BAM_URL} ${BAM_USERNAME} ${BAM_PASSWORD}

# set gpu mode to always
boinccmd --set_gpu_mode always
boinccmd --set_network_mode always
boinccmd --set_run_mode always
