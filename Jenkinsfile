node {  
    checkout scm
    echo 'before'
    def branch = getBranchName()
    echo 'after'
    
    allbr = sh(
        script: "curl 'https://api.github.com/repos/fckuligowski/abagdemo/pulls?state=open' -o pulls.json",
        returnStdout: true
    )
    // echo "allbr: ${allbr}"
    pulls = sh(
        script: "jq '.[] .head.ref' pulls.json",
        returnStdout: true
    )
    echo "pulls: ${pulls}"


    stage('Check Version') {
        echo "branch: ${branch}"
        // echo "env: ${env}"
        if (branch == 'master') {
            echo 'This is a Merge'
        } else {
            if (pulls.indexOf(branch) >= 0) {
                echo 'This is a Pull Request'
            } else {
                echo 'This is just a commit'
            }    
        }
        echo "Environment Vars:"
        echo sh(returnStdout: true, script: 'env')
    }

    def imageName = getImageName()   
    echo 'AT THE END'
}

def getBranchName() {
    fullbr = "${sh(script:'git name-rev --name-only HEAD', returnStdout: true)}"
    echo "branch: ${fullbr}"
    branch = fullbr.substring(fullbr.lastIndexOf('/') + 1, fullbr.length()).trim()
    echo "branch: ${branch}"
    return branch
}

def getImageName() {
    images = sh(
        script: "git diff origin/master -- k8s/abagdemo-deploy.yaml",
        returnStdout: true
    ).split('\n')
    echo "images: ${images}"
}