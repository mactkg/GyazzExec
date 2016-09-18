#
# Firefox拡張機能用のxpiを作る
#
XPIFILES=manifest.json exec.js exec_bg.js icons
xpi:
	/bin/rm -f gyazzexec.xpi
	zip -r gyazzexec.xpi ${XPIFILES}

sign: xpi
	web-ext sign --api-key $(MOZILLA_USER) --api-secret $(MOZILLA_SECRET)
	/bin/cp web-ext-artifacts/`ls -1 -t web-ext-artifacts | head -1` gyazzexec.xpi
