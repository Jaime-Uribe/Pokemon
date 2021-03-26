pipeline {
  agent any
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