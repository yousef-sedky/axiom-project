pipeline {
				agent any
		environment {
            VERSION= "1.0.1"  // still ??
            ARTIFACT="${env.BRANCH_NAME}-assembly-${VERSION}.jar";

                }

    stages {


// ***************** CLONE REPOSITORY *******************

        stage('Clone repository'){
            steps {
                echo "Clone repository"
                checkout scm
                  }
                    }

// ***************** Docker Build ************************

		stage('Docker Build') {
			steps {
				withCredentials([usernamePassword(credentialsId: 'docker_credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
					script {
							sh """

                   echo "Generate Dockerfile..."
                   cp Dockerfiles/Dockerfile-template microservices-artifacts/Dockerfile
                   sed -i -e "s/ARTIFACT/$ARTIFACT/g" microservices-artifacts/Dockerfile

                   echo "Dockerfile: "
                   echo "------------"
                   cat  microservices-artifacts/Dockerfile
                   echo "------------------------------------------------"
                   sleep 2
                   cd microservices-artifacts
									 docker login --username $USERNAME --password $PASSWORD
                   docker build -t yousefsedky/${env.BRANCH_NAME}:$VERSION .
  								 docker push yousefsedky/${env.BRANCH_NAME}:$VERSION
  								 # docker rmi yousefsedky/${env.BRANCH_NAME}:$VERSION  //still ??
                   rm -r Dockerfile

							"""
						    }}}}

// ******************* Kubernetes deployment using helm ************************


		stage('Deployment') {
			steps {
			    script {
                  sh """
                           cp -r microservices/deployment/${env.BRANCH_NAME}/  microservices-deploy/${env.BRANCH_NAME}
                           sed -i -e "s/VERSION/$VERSION/g"  microservices-deploy/${env.BRANCH_NAME}/values.yaml
                           sed -i -e "s/VERSION/$VERSION/g"  microservices-deploy/${env.BRANCH_NAME}/Chart.yaml

                           helm list | grep axiom-${env.BRANCH_NAME}
                           echo "/$?"
											  	 helm install --name axiom-${env.BRANCH_NAME}  microservices-deploy/${env.BRANCH_NAME} --namespace ${env.BRANCH_NAME}
													 rm -r  microservices-deploy/${env.BRANCH_NAME}

                      """
					        }}}

}}
