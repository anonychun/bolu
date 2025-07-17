set -e

for f in ~/.local/share/bolu/install/*.sh; do
  echo -e "\nRunning installer: $f"
  source "$f"
done
