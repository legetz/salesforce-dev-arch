#!/bin/bash

# GIT aliases
alias gs='git status'
alias git-clean='git stash && git clean -d -f'

# Aliases to move into VS Code projects
alias client-dev="cd $HOME/src/vs-code/client/client-dev"
alias client-qa="cd $HOME/src/vs-code/client/client-qa"
alias client-prod="cd $HOME/src/vs-code/client/client-prod"

#########################################
# SFDX related helper functions/aliases #
#########################################

# Connect to sandbox, first parameter will be the alias for the connection
function org-connect-sandbox() {
	sfdx force:auth:web:login \-r https://test.salesforce.com \-a $1;
}

# Open Salesforce org
function org-open() {
	sfdx force:org:open \-u $1
}

# Retrieve metadata from specified customer org
function metadata-retrieve() {
	rm -rf unpackaged && sfdx force:mdapi:retrieve \-r . \-k package.xml \-u $1 && mv unpackaged.zip unpackaged-$1.zip && unzip unpackaged-$1.zip && mv unpackaged unpackaged-$1;
}

function sfdx-retrieve() {
	sfdx force:source:retrieve \-\-manifest ./manifest/package.xml \-u $1;
}

# Generate delta package.xml from given commit id
function package-generate() {
	sfdx sgd:source:delta \-\-to HEAD \-\-from $1 \-\-output . \-\-repo ../../
	mv package/package.xml .
	rm -rf package; rm -rf destructiveChanges
}

# Deploy metadata to specified customer org
function metadata-deploy() {
	sfdx force:mdapi:deploy \-l RunLocalTests \-f unpackaged.zip \-w 30 \-u $1;
}

# Deploy metadata and run specified tests
function metadata-deploy-specified-tests() {
    sfdx force:mdapi:deploy \-l RunSpecifiedTests \-r $1 \-f unpackaged.zip \-w 30 \-u $2;
}

# Quick deploy metadata to specified customer org
function metadata-quick-deploy() {
    sfdx force:mdapi:deploy \-l NoTestRun \-f unpackaged.zip \-w 30 \-u $1;
}

# Validate metadata deployment to specified customer org
function metadata-validate() {
    sfdx force:mdapi:deploy \-\-checkonly \-l RunLocalTests \-f unpackaged.zip \-w 30 \-\-apiversion=50.0 \-u $1;
}

# Show org limits table
function org-limits() {
	sfdx force:limits:api:display \-u $1;
}

function sfdx-default() {
	sfdx config:set defaultusername\=$1;
}

function enable-logs() {
	sfdx force:apex:log:tail --color
}

function enable-debug-logs() {
	sfdx force:apex:log:tail --color | grep USER_DEBUG
}

alias org-list='sfdx force:org:list'
alias metadata-build='rm -rf ./unpackaged; sfdx force:source:convert -d ./unpackaged -r ../../force-app/main/default -x package.xml; zip unpackaged.zip -r unpackaged'