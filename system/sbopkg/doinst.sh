config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
    rm $NEW
  fi
}
config etc/sbopkg/sbopkg.conf.new
( cd etc/sbopkg/renames.d ; rm -rf README )
( cd etc/sbopkg/renames.d ; ln -sf /usr/doc/sbopkg-0.36.0/README-renames README )
( cd etc/sbopkg/repos.d ; rm -rf README )
( cd etc/sbopkg/repos.d ; ln -sf /usr/doc/sbopkg-0.36.0/README-repos README )
