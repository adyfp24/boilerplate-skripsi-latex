#!/bin/bash

# Jalankan semua proses sekaligus

# Bersihkan dulu
./cmd/clean.sh

# Build dokumen
./cmd/build.sh

# Versioning (patch version secara default)
./cmd/version.sh

echo "All processes completed!"