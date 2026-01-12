#!/bin/bash
# Updates PKGBUILD with new version and checksum

VERSION=$1
SHA256=$2

if [ -z "$VERSION" ] || [ -z "$SHA256" ]; then
    echo "Usage: $0 <version> <sha256>"
    exit 1
fi

sed -i "s/pkgver=.*/pkgver=$VERSION/" PKGBUILD
sed -i "s/sha256sums=.*/sha256sums=('$SHA256')/" PKGBUILD

echo "Updated PKGBUILD to version $VERSION with checksum $SHA256"
