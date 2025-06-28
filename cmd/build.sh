#!/bin/bash

# Script untuk build dokumen LaTeX ke output/pdf

# Build dokumen
echo "Building LaTeX document..."
pdflatex -output-directory=output/pdf -interaction=nonstopmode main.tex > /dev/null

# Jalankan bibtex jika diperlukan
if [ -f "output/pdf/main.aux" ]; then
    echo "Running BibTeX..."
    bibtex output/pdf/main.aux > /dev/null
fi

# Jalankan pdflatex lagi untuk menyelesaikan referensi
echo "Building LaTeX document (second pass)..."
pdflatex -output-directory=output/pdf -interaction=nonstopmode main.tex > /dev/null
pdflatex -output-directory=output/pdf -interaction=nonstopmode main.tex > /dev/null

# Pindahkan PDF ke root jika diperlukan
# mv output/pdf/main.pdf .

echo "Build completed! PDF is in output/pdf/main.pdf"