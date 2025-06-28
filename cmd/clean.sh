#!/bin/bash

# Membersihkan file-file output yang tidak diperlukan

echo "Cleaning LaTeX auxiliary files..."
rm -f output/pdf/*.aux
rm -f output/pdf/*.log
rm -f output/pdf/*.toc
rm -f output/pdf/*.lof
rm -f output/pdf/*.lot
rm -f output/pdf/*.out
rm -f output/pdf/*.bbl
rm -f output/pdf/*.blg
rm -f output/pdf/*.nav
rm -f output/pdf/*.snm
rm -f output/pdf/*.vrb
rm -f output/pdf/*.synctex.gz

echo "Cleanup complete!"