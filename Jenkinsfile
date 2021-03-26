pipeline {
  agent any
  stages {
    stage('Cancel previous build') {
      steps {
        milestone label: '', ordinal:  Integer.parseInt(env.BUILD_ID) - 1
        milestone label: '', ordinal:  Integer.parseInt(env.BUILD_ID)
      }
    }
    stage('Cocoapods') {
      steps {
        retry(count: 2) {
          dir(path: 'Pokemon') {
            sh 'pod install'
          }
        }
      }
    }
    stage('Run Tests') {
      steps {
        retry(count: 2) {
          dir(path: 'Pokemon') {
            sh 'bundle exec fastlane start_tests'
          }
        }
      }
    }
    stage('Clean workplace') {
      steps {
        deleteDir()
      }
    }
  }
}