#################
# Axiom-project #
#################

# SECTION 1 : HIGH LEVEL OVERVIEW
#################################

# 1- IaaC --> minikube (k8s) using ansible
# 2- deployment of MSs using Helm
# 3- Jenkins installed to apply CI/CD on minikube (k8s) as a pod on namespace Jenkins
# 4- countries ms and airport ms deployed each on a dedicated namespaces.
# 5- blue/green deployment applied using helm commands and deployment file using kubectl command for airports MS
# 6- blue/green logging script to verify that MS is up and running and no service interruption during deployment.
# 7- Ingress controller installed to route the requests correctly to the pods. [ingress-controller --> service --> pod ]
# 8a- Jenkins image been customised with helm/kubectl/docker installed.
# 8b- Jenkins mounted with Persistant Volume to install plugins,created pipelines etc...
# 8c- Jenkins plugins not installed in the docker image build to provide a light docker image.
# 8d- Jenkins data must be provided to prevent repeating the configurations again from the mounted volume.

# SECTION 2 : Folder Structure
##############################
.
├── Axiom-Task.md   # task required
├── Dockerfiles     # Docker file templates used.
├── Jenkinsfile     # Jenkins file for the CI/CD Pipelines
├── README.md       # Readme
├── ansible         # Ansible to install minikube / upgrade VM Ram / install helm / install jenkins etc..
│       
├── blue_green_test_script  # script for logging script to verify that no service interruption during deployment Airport MS.
|                           # please read its internal README file inside the folder blue_green_test_script.
|                           
├── jenkins                 # Jenkins Helm chart --> with added customizations in the values
|
├── microservices           # microservices contain the (countries & airports) MS Helm charts created from scratch
│   └── deployment
│       ├── airports        # airport MS
|       |
│       ├── airports-deployment.yml.old   # testing: blue/green using kubectl apply -f airports-deployment.yml --namespace airports
│       ├── airports-new-version          #  Not required just for testing purposes.
|       |
|       |
│       └── countries       # countries MS
|
├── microservices-artifacts               # Folder contains the 3 artifacts
│   ├── airports-assembly-1.0.1.jar
│   ├── airports-assembly-1.1.0.jar
│   └── countries-assembly-1.0.1.jar
├── microservices-deploy                  # empty folder used in the CI/CD pipeline
│   └── readme
└── run.sh                                # run function responsible for the ansible IaaC only

# SECTION 3 : RUN THE CODE
##########################
 1- git clone https://github.com/yousef-sedky/axiom-project.git
 2- cd axiom-project
 3- ./run.sh   ---> please add your sudo password in ansible/configs/ansible.cfg & ansible/inventory/hosts before running.
 Note: this can be encrypted in multiple ways as an enhancement ex: git-crypt or ansible vault

 4- kubectl get pods --all-namespaces
 Expected result: ingress controller , jenkins and the default k8s pods

 5- Open Jenkins using url: http://slachtec.local.jenkins/Jenkins
 6- choose pipeline under project "axiom-ms-pipeline" [Multibranch pipeline]
 7- 2 branches scanned "countries"  and "airports"
 8- choose the job required and run it and check the console logs
 9- kubectl get pods --all-namespaces to track the pods when ready.

### Countries Version 1.0.1:
http://slashtec.local.countries/countries
http://slashtec.local.countries/countries/AD  

### Airports Version 1.0.1:
http://slashtec.local.airports/airports
http://slashtec.local.airports/airports?full=0
http://slashtec.local.airports/airports?full=1
http://slashtec.local/search/NL

### Airports Version 1.1.0:
http://slashtec.local/airports?full=0
http://slashtec.local/airports?full=1
http://slashtec.local/airports/EHAM

### Jenkins URL:
http://slachtec.local.jenkins/Jenkins
