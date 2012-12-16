#! /bin/bash
pwd="$( cd "$( dirname "$0" )" && pwd )"
scriptPath="${pwd}/server.coffee"
coffee $scriptPath
