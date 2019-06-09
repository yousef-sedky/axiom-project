#########################################################################
# Simple script to check the blue/green deployment working successfully #
#########################################################################

# Open 2 MAC terminal tabs
# -------------------------

# 1st tab enter the below command
# -------------------------------
#   watch -n 5 ./blue_green_dep.sh

# Note: if watch not installed on your MAC : brew install watch

# 2nd tab enter the below command
# -------------------------------
#   tail -f blue_green_dep_logs.txt

# Run the pipeline in jenkins under the airport branch.
#


####### SOME USEFUL COMMANDS ########
#   helm history axiom-airports
#   helm list
#   kubectl get pods --all-namespaces
#   helm upgrade axiom-airports .  --set image.tag=1.0.1  # --set image.tag=1.1.0
#   kubectl get pods --all-namespaces
