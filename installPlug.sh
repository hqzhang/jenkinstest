  set -x
  
  user=hongqi
  token=11313544c092e29b17c0af08e208b0c228
  url="127.0.0.1:9999"
  jenksrc="java -jar jenkins-cli.jar -s http://${user}:${token}@${url}"
  userdst=hongqi
  tokendst=11ba0e8e73f579a6e8576f91312e65290b
  urldst="192.168.0.16:8080"
  jenkdst="java -jar jenkins-cli.jar -s http://${userdst}:${tokendst}@${urldst}"
  urlbase="http://updates.jenkins-ci.org/download/plugins"

  echo "download cli.jar a..."
  #  wget https://${user}:${token}@${url}/jnlpJars/jenkins-cli.jar

if false; then
  echo "retrieve plugins info.."
  plugins=$(${jenksrc} list-plugins  )
  #echo "rawplugins=$plugins"
  plugins=$(${jenksrc} list-plugins |sed -e 's/(.*)//' | awk '{print $1 "/" $NF "/" $1 ".hpi"}' )
  #echo "plugins=$plugins"
  plugins=$(${jenksrc} list-plugins |sed -e 's/(.*)//' | awk '{print $1 ":" $NF }' )
fi
  echo "install plugins on target"
  plugins=`cat plugins.txt`
  echo "plugins=$plugins"

  for plugin in ${plugins}
  do
      arr=(`echo $plugin| tr ":" "\n"`)
      myurl="${arr[0]}/${arr[1]}/${arr[0]}.hpi"
      #echo "download plugin wget ${urlbase}/${myurl} -P plugins"
      #wget ${urlbase}/${myurl} -P plugins
      
      echo "install ${jenkdst} install-plugin  /root/workspace/jenkinstest/plugins/${arr[0]}.hpi"
      ${jenkdst} install-plugin  "/root/workspace/jenkinstest/plugins/${arr[0]}.hpi"
      #${jenkdst} install-plugin  ${plugin}
      #${jenkdst} install-plugin  ${urlbase}/${myurl}

      #echo "create plugins.txt: $plugin"
      #echo "$plugin" >> plugins.txt
  done

