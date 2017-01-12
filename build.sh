#!/bin/sh
MAC_INSTALLER_DMG=$1
OUTPUT_DIR=out

# Prepare the image and write the processed image in out directory.
sudo upstream/prepare_iso/prepare_iso.sh -D DISABLE_REMOTE_MANAGEMENT -i .resources/gpii.jpg "$MAC_INSTALLER_DMG" $OUTPUT_DIR

# Check we have a processed image in the out directory.
PROCESSED_IMAGE=$(ls -1 $OUTPUT_DIR)
PACKER_JSON=${PROCESSED_IMAGE%%.*}.json

# Copying template and replacing relative paths.
cp upstream/packer/template.json ./$PACKER_JSON
sed -i '' -e 's/\.\./\.\/upstream/' $PACKER_JSON

# Show generated files.
echo $PROCESSED_IMAGE
echo $PACKER_JSON

# Call packer to build the box.
packer build \
	-only=virtualbox-iso \
	-var iso_url=./out/$PROCESSED_IMAGE \
	-var install_vagrant_keys=false \
	$PACKER_JSON
