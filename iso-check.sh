ISO_DIR="ISOs"
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

EXPECTED_ISOS=(
  "debian-custom.iso"
  "HBCD_PE_x64.iso"
  "mt86plus_7.20_64.iso"
  "rescatux-0.74.iso"
  "ubcd539.iso"
)

echo "==> Checking for required ISOs..."

if [ ! -d "$ISO_DIR" ]; then
  echo -e "${RED}ERROR: ISOs/ directory not found!${NC}" >&2
  exit 1
fi

missing_isos=()
for iso in "${EXPECTED_ISOS[@]}"; do
  if [ ! -f "$ISO_DIR/$iso" ]; then
    missing_isos+=("$iso")
  fi
done

if [ ${#missing_isos[@]} -gt 0 ]; then
  echo -e "${RED}ERROR: Missing ISOs:${NC}" >&2
  for iso in "${missing_isos[@]}"; do
    echo -e "${RED}  - $iso${NC}" >&2
  done
  exit 1
fi

echo -e "${GREEN}✓ All expected ISOs found${NC}"

# TODO: checksum for each (where available)
