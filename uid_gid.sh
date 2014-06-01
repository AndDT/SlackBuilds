#!/bin/bash

case "$1" in
  postfix)    
    groupadd -g 200 postfix
    useradd -u 200 -d /dev/null -s /bin/false -g postfix postfix
    groupadd -g 201 postdrop
    ;;
  dovecot)
    groupadd -g 202 dovecot
    useradd -d /dev/null -s /bin/false -u 202 -g 202 dovecot
    groupadd -g 248 dovenull
    useradd -d /dev/null -s /bin/false -u 248 -g 248 dovenull
    ;;
  mailman)
    MAILMAN_UID=${MAILMAN_UID:-204}
    MAILMAN_GID=${MAILMAN_GID:-204}
    groupadd -g $MAILMAN_GID mailman
    useradd -u $MAILMAN_UID -d /dev/null -s /bin/false -g mailman mailman
    ;;
  privoxy)
    PRIVOXY_USER=${PRIVOXY_USER:-privoxy}
    PRIVOXY_GROUP=${PRIVOXY_GROUP:-privoxy}
    groupadd -g 206 $PRIVOXY_GROUP
    useradd -u 206 -g $PRIVOXY_GROUP -d /dev/null -s /bin/false $PRIVOXY_USER
    ;;
  lighttpd)
    LIGHTTPD_USER=${LIGHTTPD_USER:-lighttpd}
    LIGHTTPD_GROUP=${LIGHTTPD_GROUP:-lighttpd}
    groupadd -g 208 $LIGHTTPD_GROUP
    useradd -u 208 -g $LIGHTTPD_GROUP -d /var/www $LIGHTTPD_USER
    ;;
  postgresql)
    PG_UID=${PG_UID:-209}
    PG_GID=${PG_GID:-209}
    groupadd -g $PG_GID postgres
    useradd -u $PG_UID -g $PG_GID -d /var/lib/pgsql postgres
    ;;
  clamav)
    groupadd -g 210 clamav
    useradd -u 210 -d /dev/null -s /bin/false -g clamav clamav
    ;;
  amavisd-new)
    groupadd -g 225 amavis
    useradd -d /var/lib/amavis -s /bin/bash -u 225 -g 225 amavis
    ;;
  ntop)
    NTOPUSER=${NTOPUSER:-ntop}
    NTOPGROUP=${NTOPGROUP:-ntop}
    groupadd -g 212 $NTOPGROUP
    useradd -u 212 -g $NTOPGROUP -d /var/lib/ntop -s /bin/false $NTOPUSER
    ;;
  nagios)
    groupadd -g 213 nagios
    useradd -d /dev/null -s /bin/false -u 213 -g nagios nagios
    ;;
  avahi)
    groupadd -g 214 avahi
    useradd -u 214 -g 214 -c "Avahi" -d /dev/null -s /bin/false avahi
    ;;
  virtualbox)
    groupadd -g 215 vboxusers
    useradd -u 240 -g 215 -d /var/lib/vboxweb vboxweb
    useradd -u 215 -d /var/run/vboxadd -g 1 -s /bin/sh vboxadd
    ;;
  pulseaudio)
    groupadd -g 216 pulse
    useradd -g pulse -u 216 -d /var/lib/pulse pulse
    ;;
  nut)
    NUTUSER=${NUTUSER:-nut}
    NUTGROUP=${NUTGROUP:-nut}
    groupadd -g 218 $NUTGROUP
    useradd -u 218 -g $NUTGROUP -s /bin/false $NUTUSER
    ;;
  znc)
    ZNC_USER=${ZNC_USER:-znc}
    useradd -u 219 -g 99 -c "ZNC User" -d /etc/znc $ZNC_USER
    ;;
  tor)
    TOR_USER=${TOR_USER:-tor}
    TOR_UID=${TOR_UID:-220}
    TOR_GROUP=${TOR_GROUP:-tor}
    TOR_GID=${TOR_GID:-220}
    groupadd -g $TOR_GID $TOR_GROUP
    useradd -u $TOR_UID -g $TOR_GID -c "The Onion Router" -d /dev/null -s /bin/false $TOR_USER
    ;;
  exim)
    groupadd -g 222 exim
    useradd -d /var/spool/exim -g exim -s /bin/false -u 222 exim
    ;;
  policyd2)
    groupadd -g 223 policyd
    useradd -d /dev/null -s /bin/false -u 223 -g 223 policyd
    ;;
  thttpd)
    groupadd -g 227 thttpd
    useradd -u 227 -g 227 -c "User for thttpd" -d / -s /bin/false thttpd
    ;;
  zabbix_server)
    ZABBIXUSER=${ZABBIXUSER:-zabbix}
    ZABBIXGROUP=${ZABBIXGROUP:-zabbix}
    ZABBIXUID=${ZABBIXUID:-228}
    ZABBIXGID=${ZABBIXGID:-228}
    groupadd -g $ZABBIXGID $ZABBIXGROUP
    useradd -u $ZABBIXUID -g $ZABBIXGROUP -d /dev/null -s /bin/false $ZABBIXUSER
    ;;
  davfs2)
    DAVFS2_USER=${DAVFS2_USER:-davfs2}
    DAVFS2_GROUP=${DAVFS2_GROUP:-davfs2}
    groupadd -g 230 $DAVFS2_GROUP
    useradd -u 230 -d /var/cache/davfs2 -g $DAVFS2_GROUP -s /bin/false $DAVFS2_USER
    ;;
  couchdb)
    groupadd -g 231 couchdb
    useradd -u 231 -g couchdb -d /var/lib/couchdb -s /bin/sh couchdb
    ;;
  apache-tomcat)
    groupadd -g 232 tomcat
    useradd -u 232 -g tomcat -d /var/lib/tomcat tomcat
    ;;
  cvsd)
    groupadd -g 233 cvsd
    useradd -u 233 -g cvsd -d /srv/cvsd -s /bin/false cvsd
    ;;
  kismet)
    groupadd -g 234 kismet
    ;;
  cyrus-imapd)
    groupadd -g 238 cyrus
    useradd -d /var/imap -s /bin/sh -u 238 -g 238 cyrus
    ;;
  dkimproxy)
    groupadd -g 239 dkim
    useradd -u 239 -d /dev/null -s /bin/false -g dkim dkim
    ;;
  mediatomb)
    groupadd -g 241 mediatomb
    useradd -u 241 -g mediatomb -d /var/lib/mediatomb mediatomb
    ;;
  armagetronad)
    AUSER=armagetronad
    AUID=244
    AGID=20
    useradd -u ${AUID} -g ${AGID} ${AUSER}
    ;;
  quagga)
    groupadd -g 245 quagga
    useradd -g quagga -u 245 -s /bin/false -c "Quagga routing suite" -d /var/run/quagga/ quagga
    groupadd -g 246 quaggavt
    ;;
  bitlbee)
    BITLBEE_USER=${BITLBEE_USER:-250}
    BITLBEE_GROUP=${BITLBEE_GROUP:-250}
    groupadd -g $BITLBEE_USER bitlbee
    useradd -u $BITLBEE_USER -d /var/lib/bitlbee -s /bin/false -g bitlbee bitlbee
    ;;
  jenkins)
    groupadd -g 251 jenkins
    useradd -g 251 -u 251 -r -s /bin/bash -d /var/lib/jenkins jenkins
    ;;
  nexus)
    groupadd -g 252 nexus
    useradd -u 252 -d /dev/null -s /bin/sh -g nexus nexus
    ;;
  jboss)
    groupadd -g 254 jboss
    useradd -u 254 -M -r -s /bin/bash -d /usr/share/jboss-as -c "JBoss Application Server" -g jboss jboss
    ;;
  miredo)
    groupadd -g 255 miredo
    useradd -u 255 -g 255 -c "Teredo IPv6 Tunneling" -d /dev/null -s /bin/false miredo
    ;;
  havp)
    groupadd -g 210 clamav
    useradd -u 256 -d /dev/null -s /bin/false -g clamav havp
    ;;
  pcsc-lite)
    groupadd -g 257 pcscd
    useradd -u 257 -g pcscd -d /var/run/pcscd -s /bin/false pcscd
    ;;
  rplay)
    RPLAYUSER=${RPLAYUSER:-rplayd}
    RPLAYGROUP=${RPLAYGROUP:-rplayd}
    RPLAYUID=${RPLAYUID:-258}
    RPLAYGID=${RPLAYGID:-258}
    groupadd -g $RPLAYGID $RPLAYGROUP
    useradd -u $RPLAYUID -g $RPLAYGROUP -d /dev/null -s /bin/false $RPLAYUSER
    ;;
  hiawatha)
    groupadd -g 259 hiawatha
    useradd -u 259 -g 259 -c "User for hiawatha" -d / -s /bin/false hiawatha
    groupadd -g 260 php-fcgi
    useradd -u 260 -g 260 -c "User for php-fcgi" -d / -s /bin/false php-fcgi
    ;;
  glassfish)
    groupadd -g 263 glassfish
    useradd -u 263 -g glassfish -d /var/lib/glassfish -s /bin/false glassfish
    ;;
  etherpad-lite)
    ETHERPAD_USER=${ETHERPAD_USER:-etherpad}
    ETHERPAD_UID=${ETHERPAD_UID:-264}
    ETHERPAD_GROUP=${ETHERPAD_GROUP:-etherpad}
    ETHERPAD_GID=${ETHERPAD_GID:-264}
    groupadd -g $ETHERPAD_GID $ETHERPAD_GROUP
    useradd -u $ETHERPAD_UID -g $ETHERPAD_GID -c "Etherpad lite" -m $ETHERPAD_USER
    ;;
  openfire)
    OPENFIRE_USER=${OPENFIRE_USER:-openfire}
    OPENFIRE_UID=${OPENFIRE_UID:-265}
    OPENFIRE_GROUP=${OPENFIRE_GROUP:-openfire}
    OPENFIRE_GID=${OPENFIRE_GID:-265}
    groupadd -g $OPENFIRE_GID $OPENFIRE_GROUP
    useradd -u $OPENFIRE_UID -g $OPENFIRE_GID -c "Openfire Server" -m $OPENFIRE_USER
    ;;
  zabbix_agentd)
    ZABBIXUSER=${ZABBIXUSER:-zabbix}
    ZABBIXGROUP=${ZABBIXGROUP:-zabbix}
    ZABBIXUID=${ZABBIXUID:-228}
    ZABBIXGID=${ZABBIXGID:-228}
    
    ZABBIXAGENTUSER=${ZABBIXAGENTUSER:-zabbixagent}
    ZABBIXAGENTGROUP=${ZABBIXAGENTGROUP:-zabbixagent}
    ZABBIXAGENTUID=${ZABBIXAGENTUID:-266}
    ZABBIXAGENTGID=${ZABBIXAGENTGID:-266}
    groupadd -g $ZABBIXGID $ZABBIXGROUP
    useradd -u $ZABBIXUID -g $ZABBIXGROUP -d /dev/null -s /bin/false $ZABBIXUSER
    useradd -u $ZABBIXAGENTUID -g $ZABBIXGROUP -d /dev/null -s /bin/false $ZABBIXAGENTUSER
    ;;
  bacula)
    groupadd -g 268 bacula
    useradd -u 268 -d /dev/null -s /bin/false -g bacula bacula
    ;;
  freeswitch)
    groupadd -g 269 freeswitch
    useradd -u 269 -d /opt/freeswitch -s /bin/bash -g freeswitch freeswitch
    ;;
  opensmtpd)
    groupadd -g 270 smtpd
    useradd -u 270 -g 270 -r -s /bin/false -d /var/empty smtpd
    groupadd -g 271 smtpq
    useradd -u 271 -g 271 -r -s /bin/false -d /var/empty smtpq
    ;;
  radius)
    groupadd -g 272 radius
    useradd -u 272 -d /dev/null -s /bin/false -g radius radius
    mkdir -p /etc/raddb /var/run/radiusd /var/log/radius
    chown -R radius:radius /etc/raddb /var/run/radiusd /var/log/radius
    ;;
  roger-router)
    groupadd -g 273 fax
    ;;
  prosody)
    groupadd -g 274 prosody
    useradd -u 274 -g 274 -s /sbin/nologin -d /var/lib/prosody prosody
    ;;
  jabberd2)
    JABBERUSR=${JABBERUSR:-jabber}
    JABBERGRP=${JABBERGRP:-jabber}
    JABBERUID=${JABBERUID:-275}
    JABBERGID=${JABBERGID:-275}
    groupadd -g ${JABBERGID} ${JABBERGRP}
    useradd -u ${JABBERUID} -g ${JABBERGRP} ${JABBERUSR}
    ;;
  usbmux)
    useradd -u 277 -g plugdev -d /dev/null -s /bin/false usbmux
    ;;
  plexmediaserver)
    PLEX_USER=${PLEX_USER:-279}
    PLEX_GROUP=${PLEX_GROUP:-279}
    groupadd -g $PLEX_USER plex
    useradd -u $PLEX_USER -d /var/lib/plexmediaserver -s /bin/false -g plex plex
    ;;
  elasticsearch)
    ES_USER=${ES_USER:-elasticsearch}
    ES_UID=${ES_UID:-280}
    ES_GROUP=${ES_GROUP:-elasticsearch}
    ES_GID=${ES_GID:-280}
    groupadd -g $ES_GID $ES_GROUP
    useradd -u $ES_UID -g $ES_GROUP -s /bin/sh $ES_USER
    ;;
  docker)
    groupadd -r -g 281 docker
    echo "usermod -a -G docker <your_username>"
    ;;
  wildfly)
    groupadd -g 282 wildfly
    useradd -u 282 -M -r -s /bin/bash -d /usr/share/wildfly -c "Wildfly Application Server" -g wildfly wildfly
    ;;
  icecream)
    groupadd -g 283 icecream
    useradd -u 283 -g icecream -d /var/cache/icecream icecream
    ;;
  *)
    echo "Usage: $0 <name of package>"
    echo
    echo "This script add users and groups for packages:"
    echo "postfix dovecot mailman privoxy lighttpd postgresql clamav amavisd-new ntop nagios avahi virtualbox pulseaudio nut znc tor exim policyd2 thttpd zabbix_server davfs2 couchdb apache-tomcat cvsd kismet cyrus-imapd dkimproxy mediatomb armagetronad quagga bitlbee jenkins nexus jboss miredo havp pcsc-lite rplay hiawatha glassfish etherpad-lite openfire zabbix_agentd bacula freeswitch opensmtpd radius roger-router prosody jabberd2 usbmux plexmediaserver elasticsearch docker wildfly icecream"
    exit 0
    ;;
esac