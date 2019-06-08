#########################################################################
# Simple script to check the blue/green deployment working successfully #
#########################################################################

# Open 3 MAC terminal tabs
# -------------------------

# 1st tab enter the below command
# -------------------------------
#   watch -n 5 ./bluegreendep.sh

# Note: if watch not installed : brew install watch

# 2nd tab enter the below command
# -------------------------------
#   tail -f bluegreendep_logs.txt

# 3rd tab update the deployment
# -----------------------------
#   helm history axiom-airports
#   helm list
#   kubectl get pods --all-namespaces
#   helm upgrade axiom-airports .  --set image.tag=1.0.1  # --set image.tag=1.1.0
#   kubectl get pods --all-namespaces
