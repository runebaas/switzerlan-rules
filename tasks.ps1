####
# Params
####
Param(
    [Parameter(Mandatory)]
    [string]$TaskName
)

####
# Global Variables
####
$workdir = Get-Item .
$ruleFolder = Get-Item "./rules"

$websiteFolder = Get-Item "./website"
$contentFolder = "$websiteFolder/content"

$nl = [System.Environment]::NewLine

$finalPages = ('Main Rulebook','osu!','Rocket League','Hearthstone','Overwatch 2','Apex Legends','Valorant','Apex Legends', 'Counter Strike 2', 'League of Legends Fun', 'League of Legends Pro')

####
# Shared Functions
####
function CreateContentSkeleton() {
    if (Test-Path -Path $contentFolder -PathType Container) {
        Remove-Item -Recurse -Force "$contentFolder"
    }
    New-Item -Type Directory -Path "$contentFolder"
    New-Item -Type Directory -Path "$contentFolder/rules"
    New-Item -Type Directory -Path "$contentFolder/menu"
}

function GeneratePage([string]$pageTitle, [string]$pageContent) {
    if ($finalPages -contains $pageTitle) {
        return @"
+++
title = "$pageTitle"
type = "docs"
+++

$pageContent
"@
    }

    return @"
+++
title = "$pageTitle"
type = "docs"
+++

{{< hint warning >}}
**Provisional Rules**
The rules have not been updated for 2024. The rules are provisional and may be used as reference, but are subject to change at any time while this banner is shown.
{{< /hint >}}

$pageContent
"@
}

function GenerateMainRulebook() {
    $pageContent = [IO.File]::ReadAllText("$ruleFolder/general/main-rulebook.md")
    return GeneratePage "Main Rulebook" $pageContent
}

function GetTournamentPages() {
    $pages = foreach ($rulebook in Get-ChildItem "$ruleFolder/tournaments") {
        $fullName = (Get-Content -First 1 $rulebook.FullName).Substring(2)
        $shortName = [System.IO.Path]::GetFileNameWithoutExtension($rulebook)
        $pageContent = [IO.File]::ReadAllText($rulebook.FullName)

        New-Object PSObject –Property @{
            long    = "$fullName"
            short   = $shortName
            file    = $rulebook.FullName
            content = (GeneratePage $fullName $pageContent)
        }
    }

    return $pages
}

function GenerateMenuItem($longName, $shortName) {
    return @"
$nl- [$longName]({{< relref "/rules/$shortName">}})
"@
}

function WriteMenu($pages) {
    $menuItems = foreach ($page in $pages) { GenerateMenuItem $page.long $page.short }
    return @"
+++
headless = true
+++

- **General**

- [Main Rules]({{< relref "/" >}})

<br />

- **Tournaments**
$menuItems
"@
}

####
# Tasks
####
switch ($TaskName) {
    "sync-content" {
        CreateContentSkeleton

        GenerateMainRulebook > "$contentFolder/_index.md"

        $pages = GetTournamentPages
        foreach ($page in $pages) {
            Write-Output $page.content > "$contentFolder/rules/$($page.short).md"
        }

        WriteMenu $pages > "$contentFolder/menu/index.md"

        Write-Output Done!
    }

    "build" {
        Set-Location $websiteFolder
        hugo --minify
    }

    "clean" {
        $placesToClean = @("$websiteFolder/content", "$websiteFolder/public", "$websiteFolder/resources")
        foreach ($places in $placesToClean) {
            if (Test-Path -Path $places) {
                Remove-Item -Recurse -Force "$places"
            }
        }
    }

    Default {
        Write-Output "No such task"
        exit 1
    }
}

####
# Post hooks
####
Set-Location $workdir
