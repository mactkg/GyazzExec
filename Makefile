#
# Firefox拡張機能用のxpiを作る
#
# XPIFILES=manifest.json exec.js exec_bg.js jquery-2.1.4.min.js p5.min.js icons
XPIFILES=manifest.json exec.js exec_bg.js jquery-2.1.4.min.js icons
xpi:
	/bin/rm -f gyazzexec.xpi
	zip -r gyazzexec.xpi ${XPIFILES}

sign: xpi
	web-ext sign --api-key $(MOZILLA_USER) --api-secret $(MOZILLA_SECRET)
	/bin/cp web-ext-artifacts/`ls -1 -t web-ext-artifacts | head -1` gyazzexec.xpi
