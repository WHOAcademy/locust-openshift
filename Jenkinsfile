pipeline {
    agent {
        label "master"
    }

    stages {
        stage("Deploy the Python script as ConfigMap") {
            failFast true
            parallel {
                stage("Clone source code from Git repository") {
                    options {
                        skipDefaultCheckout(true)
                    }
                    agent {
                        node {
                            label "master"
                        }
                    }
                    steps {
                        script {
                            // Global variables
                            env.FILE_NAME = "locustfile.py"
                            env.HOST_URL = "http://app-locust.apps.dev.lxp.academy.who.int"
                        }
                    }
                }
                stage("Deploy the script") {
                    agent {
                        node {
                            label "jenkins-agent-python38"
                        }
                    }
                    steps {
                        script {
                            echo '### Deploy the Python script as ConfigMap ###'
                            sh '''
                                sh ./seed.sh ${FILE_NAME} ${HOST_URL}
                            '''
                        }
                    }
                }
            }
        }
    }
}
