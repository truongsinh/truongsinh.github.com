#! /bin/bash
pwd="$( cd "$( dirname "$0" )" && pwd )"
scriptPath="${pwd}/build.coffee"
coffee $scriptPath
