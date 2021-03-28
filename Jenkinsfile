node {
    stage('Checkout/Build/Test') {

        // Checkout files.
        checkout([
            $class: 'GitSCM',
            branches: [[name: 'main']],
            doGenerateSubmoduleConfigurations: false,
            extensions: [], submoduleCfg: [],
            userRemoteConfigs: [[
                name: 'github',
                url: 'https://github.com/Jaime-Uribe/Pokemon'
            ]]
        ])

        // Build and Test
        sh 'xcodebuild -workspace Pokemon.xcworkspace -scheme Pokemon -derivedDataPath Build/ -destination "platform=iOS Simulator,OS=14.4,id=303094CB-B10F-4918-8557-F709210540CF"  -enableCodeCoverage YES clean build test CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO'

        // Publish test restults.
        step([$class: 'JUnitResultArchiver', allowEmptyResults: true, testResults: 'coverage/cobertura.xml'])
    }

    stage('Analytics') {

        parallel Coverage: {
            // Generate Code Coverage report
            sh '/usr/local/bin/slather coverage --jenkins --cobertura-xml --scheme Pokemon Pokemon.xcodeproj/'

            // Publish coverage results
            publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'html', reportFiles: 'index.html', reportName: 'Coverage Report'])


        }, failFast: true|false
    }
}