config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
    rm $NEW
  fi
}

config etc/fish/config.fish.new

( cd etc ; sed -i '/^\/usr\/bin\/fish/d' shells )
( cd etc ; grep -q '/usr/bin/fish' shells || echo '/usr/bin/fish' >> shells )
