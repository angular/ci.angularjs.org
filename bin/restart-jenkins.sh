#!/bin/bash

launchctl unload ~/Library/LaunchAgents/org.jenkins-ci.plist
launchctl load ~/Library/LaunchAgents/org.jenkins-ci.plist
