$commitNote = $args[0]

if (-not $commitNote){
    Write-Host "! Usage: ./push.ps1 'your message here'"
    exit 1
}


# $commitNote = Read-Host "Enter commit name"
$currentFolder = Split-path -Leaf (Get-Location)


if ($currentFolder -eq 'zk-book-prod'){
    Write-Output  "> commit '$commitNote' to remote"
    git add .
    git commit -m "$commitNote"
    $currentBranch = git rev-parse --abbrev-ref HEAD
    Write-Output "> current branch: $currentBranch"
    git push origin $current_branch
}
else{
    Write-Output "> E: failed to find the folder 'my-electron-app'"
}