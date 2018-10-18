# SSI image for thuv

## Files 

 - Dockerfile, install packages and copies scripts/config
 - setup.sh , Dockerfile entrypoint, pass login|password as arguments of docker run
 - SSI_test.sh , Scenario of a user (run over ssh)

## Commands

Build : `docker build -t shell_test .`
Run : `docker run -d -h 'ssi_test' -p 3000:22 shell_test <login> <passwd>`
SSH : `ssh -p 3000 -t <login>@0.0.0.0 'echo <passwd> | sudo -S /bin/bash /usr/local/SSI_test.sh'` (user passwd is the one provided in docker run)