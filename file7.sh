echo "Enter the package name: "  
read package_name
userid=$(dumpsys package $package_name | grep  "userId=" | head -n 1 | awk -F "=" '{print $2}' | awk '{print $1;}')
echo "$userid"
while true
do
        tcp6data=$(md5sum /proc/net/tcp6)
	tcpdata=$(md5sum /proc/net/tcp)
	udpdata=$(md5sum /proc/net/udp)
	udp6data=$(md5sum /proc/net/udp6)
        if [ "$tcp6data" != "$(md5sum /proc/net/tcp6)" ]
        then
               echo "TCP6 file updated"




		grep -r "$userid" /proc/net/tcp6  | awk 'function hextodec(str,ret,n,i,k,c){
    ret = 0
    n = length(str)
    for (i = 1; i <= n; i++) {
        c = tolower(substr(str, i, 1))
        k = index("123456789abcdef", c)
        ret = ret * 16 + k
    }
    return ret
}
function getIP(str,ret){
    ret=hextodec(substr(str,index(str,":")-2,2));
    for (i=29; i>23; i-=2) {
        ret = ret"."hextodec(substr(str,i,2))
    }
    ret = ret":"hextodec(substr(str,index(str,":")+1,4))
    return ret
}

function ip6(str,ret){
			valu=hextodec(substr(str,index(str,":")-2,2));
			for (i=1; i<24; i+=4) {
        					ret = ret":"substr(str,i,4)
    					      }
			return ret
			}


		{{ print " ";remote=getIP($4);value=ip6($4)}{print value":"remote" "$1}}' >> "/sdcard/$package_name"
                

                 cat /proc/net/tcp6 | grep "$userid" | awk '{print $3,$8}'
                #result=$(md5sum /proc/net/tcp)

##############################  tcp ##########################

  elif [ "$tcpdata" != "$(md5sum /proc/net/tcp)" ]
        then
               echo "TCP file updated"




                grep -r "$userid" /proc/net/tcp  | awk 'function hextodec(str,ret,n,i,k,c){
              
    ret = 0
    n = length(str)
    for (i = 1; i <= n; i++) {
        c = tolower(substr(str, i, 1))
        k = index("123456789abcdef", c)
        ret = ret * 16 + k
    }
    return ret
}
function getIP(str,ret){
    ret=hextodec(substr(str,index(str,":")-2,2));
    for (i=5; i>0; i-=2) {
        ret = ret"."hextodec(substr(str,i,2))
    }
    ret = ret":"hextodec(substr(str,index(str,":")+1,4))
    return ret
}

      {{ print " ";remote=getIP($4)}{print "  "remote" "$1}}' >> "/sdcard/$package_name"


                 cat /proc/net/tcp | grep "$userid" | awk '{print $3,$8}'

########################  UDP #################################################

elif [ "$udpdata" != "$(md5sum /proc/net/udp)" ]
        then
               echo "UDP file updated"




                grep -r "$userid" /proc/net/udp  | awk 'function hextodec(str,ret,n,i,k,c){
              
    ret = 0
    n = length(str)
    for (i = 1; i <= n; i++) {
        c = tolower(substr(str, i, 1))
        k = index("123456789abcdef", c)
        ret = ret * 16 + k
    }
    return ret
}
function getIP(str,ret){
    ret=hextodec(substr(str,index(str,":")-2,2));
    for (i=5; i>0; i-=2) {
        ret = ret"."hextodec(substr(str,i,2))
    }
    ret = ret":"hextodec(substr(str,index(str,":")+1,4))
    return ret
}

      {{ print " ";remote=getIP($4)}{print "  "remote" "$1}}' >> "/sdcard/$package_name"


                 cat /proc/net/udp | grep "$userid" | awk '{print $3,$8}'

########################## UDP6  ##########################################

elif [ "$ud6pdata" != "$(md5sum /proc/net/udp6)" ]
        then
               echo "UDP6 file updated"




                grep -r "$userid" /proc/net/udp6  | awk 'function hextodec(str,ret,n,i,k,c){

    ret = 0
    n = length(str)
    for (i = 1; i <= n; i++) {
        c = tolower(substr(str, i, 1))
        k = index("123456789abcdef", c)
        ret = ret * 16 + k
    }
    return ret
}
function getIP(str,ret){
    ret=hextodec(substr(str,index(str,":")-2,2));
    for (i=29; i>23; i-=2) {
        ret = ret"."hextodec(substr(str,i,2))
    }
    ret = ret":"hextodec(substr(str,index(str,":")+1,4))
    return ret
}

function ip6(str,ret){
                        valu=hextodec(substr(str,index(str,":")-2,2));
                        for (i=1; i<24; i+=4) {
                                                ret = ret":"substr(str,i,4)
                                              }
                        return ret
                        }


                {{ print " ";remote=getIP($4);value=ip6($4)}{print value":"remote" "$1}}' >> "/sdcard/$package_name"


                 cat /proc/net/udp6 | grep "$userid" | awk '{print $3,$8}'

	else
                echo ""
                tcp6data=$(md5sum /proc/net/tcp6)
		tcpdata=$(md5sum /proc/net/tcp)
        	udpdata=$(md5sum /proc/net/udp)
        	udp6data=$(md5sum /proc/net/udp6)

        fi
#       echo "Do something; hit [CTRL+C] to stop!"

done
