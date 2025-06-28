#!/bin/bash

# Script untuk versioning dokumen

# Baca versi terakhir
if [ -f "VERSION" ]; then
    CURRENT_VERSION=$(cat VERSION)
else
    CURRENT_VERSION="v0.0.0"
fi

# Ekstrak angka versi saja (tanpa 'v')
VERSION_NUM=$(echo $CURRENT_VERSION | sed 's/^v//')

# Tentukan versi baru berdasarkan argumen
if [ "$1" == "major" ]; then
    NEW_VERSION=$(echo $VERSION_NUM | awk -F. '{print $1+1".0.0"}')
elif [ "$1" == "minor" ]; then
    NEW_VERSION=$(echo $VERSION_NUM | awk -F. '{print $1"."$2+1".0"}')
else
    NEW_VERSION=$(echo $VERSION_NUM | awk -F. '{print $1"."$2"."$3+1}')
fi

# Tambahkan 'v' kembali
NEW_VERSION="v$NEW_VERSION"

# Update versi
echo $NEW_VERSION > VERSION
echo "Version updated to $NEW_VERSION"

# Buat salinan PDF dengan versi
if [ -f "output/pdf/main.pdf" ]; then
    cp output/pdf/main.pdf "output/pdf/main_${NEW_VERSION}.pdf"
    echo "Versioned PDF created: output/pdf/main_${NEW_VERSION}.pdf"
else
    echo "Error: main.pdf not found. Build the document first."
fi