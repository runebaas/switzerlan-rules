# SwitzerLAN Rulebook Directory

This repository contains the rulebooks for all tournaments happening at [SwitzerLAN](https://switzerlan.ch/).

This repository is published to [rules.switzerlan.ch](https://rules.switzerlan.ch/)

## Repository Structure

#### `/rules`

This folder contains all the main rulebook and the rulebooks for each tournament in markdown.

#### `/website`

This folder contains a skeleton hugo website.

## Building the rulebook directory

### Prerequisites

* [Hugo](https://gohugo.io/getting-started/installing/)
* [Powershell 7 or newer](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell)

### Building

Run the following commands

```
pwsh ./tasks.ps1 sync-content
pwsh ./tasks.ps1 build
```
