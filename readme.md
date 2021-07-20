# translunar.space source

this repository contains all the notebook files and automation used to produce translunar.space. currently it contains some quick and dirty scripts to convert mathematica notebooks into articles. as stated in the [introduction](https://translunar.space) this project is open to any contributions that follow the [guide](https://translunar.space/meta/guide). i will happily add support for other languages (python, julia, etc) on request.

## contributing

new contributors should file pull requests on this repository to make changes. it's worth noting that contributions from new faces will be reviewed slowly and extensively, and core contributors may request full rewrites to fit the project style. this is not intended to be exclusionary, but we do wish to maintain a specific project direction.

if you'd like to become a core contributor, please file an issue with your request and rationale.

## what we need

this initial architecture and design for the site was hastily thrown together by sig. as the project grows, it will need to be rewritten entirely. as well, as a community research and engineering project, a lot of work will need to be done for coordination and to make sure everyone has access to resources. here's a quick list of obvious directions for growth:

- a proper static site generator and templating system, probably written in haskell
- a forum for discussing the project in a more organized fashion than chat
- a shared research/reference manager for the community
- cluster orchestration tools for easy deployment of compute jobs on aws
