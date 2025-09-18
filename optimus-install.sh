#!/usr/bin/env bash
set -euo pipefail

echo "==> Inštalujem Optimus by Radoslav Čornanič"

PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
PD_ROOT="$PREFIX/var/lib/proot-distro"
ROOTFS_DIR="$PD_ROOT/installed-rootfs/debian"

# 1) Základné nástroje v Termuxe
pkg update -y || true
pkg install -y proot-distro proot tar coreutils tmux curl wget git rsync grep sed jq neovim nano || true

# 2) Over rootfs balík
[ -f "./optimus-rootfs.tar.gz" ] || { echo "Chýba optimus-rootfs.tar.gz v aktuálnom priečinku."; exit 1; }

# 3) Vytvor cesty a rozbal rootfs
mkdir -p "$ROOTFS_DIR"
echo "==> Rozbaľujem rootfs do: $ROOTFS_DIR"
tmpd="$(mktemp -d)"; trap 'rm -rf "$tmpd"' EXIT
tar -xzf "./optimus-rootfs.tar.gz" -C "$tmpd"
rm -rf "${ROOTFS_DIR:?}"/*
rsync -aHAX --numeric-ids "$tmpd/." "$ROOTFS_DIR/"

# 4) Nasadenie príkazov (ak sú priložené)
for cmd in optimus koranos optimus-health optimus-repair optimus-upgrade optimus-snapshot optimus-restore optimus-reset optimus-enable optimus-disable optimus-watchdog; do
  if [ -f "./$cmd" ]; then
    cp -f "./$cmd" "$PREFIX/bin/$cmd"
    chmod +x "$PREFIX/bin/$cmd"
    echo " - príkaz '$cmd' nainštalovaný"
  fi
done

# 5) Krátky health test
if command -v proot-distro >/dev/null 2>&1; then
  echo "==> Krátky test loginu do Optimus..."
  proot-distro login debian -- bash -lc 'echo "[OK] Optimus login funguje. ID: $(grep -E "^ID=" /etc/os-release | cut -d= -f2)"' || true
fi

echo "==> Hotovo. Spusti:"
echo "    optimus    # vstup do Optimus"
echo "    koranos    # spustenie tvojich packov"
