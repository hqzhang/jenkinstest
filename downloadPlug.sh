#!/bin/bash
# plugins.txt format   plugins-name:version
  set -x
  echo "download plugins "
  urlbase="http://updates.jenkins-ci.org/download/plugins"

  plugins=`cat plugins.txt`
  echo "plugins=$plugins"

  for plugin in ${plugins}
  do
      arr=(`echo $plugin| tr ":" "\n"`)
      myurl="${arr[0]}/${arr[1]}/${arr[0]}.hpi"
      echo "download plugin wget ${urlbase}/${myurl} -P plugins"
      wget ${urlbase}/${myurl} -P plugins
  done

