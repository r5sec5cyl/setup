# setup

Setup scripts for new local compute environments. Unless otherwise noted, scripts can be re-run safely to re-install and re-configure environment.

For all environments, the scripts set a baseline of:
- bash 5.2
- git with user and ssh configuration
- appropriate package managers
- apps
  - shell utilities (jq, yq, wget, watch, tldr)
  - AWS CLI
  - k8s utilities (kubectl, helm, stern)
  - GUI dev utilities (VS Code / Codium, Meld, SourceTree except on Linux, Firefox)
- programming languages
  - go
  - python
  - node
  - rust
  - zig
- docker (via colima on MacOS, not yet complete on Windows)
- maps Capslock key to left Control key (except on Linux, WIP)

There are some shell environment configurations but this does not otherwise establish the shell profile. 

## macOS

### Profile setup

Setup bash and zsh profiles to refer to `.profile`.

### brew

Installs brew and sets up git (which is installed with brew).

### ssh

Sets up ssh keys and configuration for GitHub access. 
TODO: Make it not GH-specific.

### apps

Install standard dev tools and apps.

### bash

Install bash 5.2, set it as default, and add a timestamped prompt.

### languages

Install programming languages. Defaulting to include:

- go
- python
- node
- rust
- zig

### docker

colima and docker setup.
