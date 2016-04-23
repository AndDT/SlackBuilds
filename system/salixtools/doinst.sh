if [ ! -x etc/rc.d/rc.numlock ]; then
	chmod 644 etc/rc.d/rc.numlock.new
else
	chmod 755 etc/rc.d/rc.numlock.new
fi
mv -f etc/rc.d/rc.numlock.new etc/rc.d/rc.numlock
