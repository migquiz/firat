#!/bin/bash

#download and install Ghostscript

#change the value of this variable according to the path
#where the executable file is located
#you should edit the value of this variable based on what shell you use
#if you use git bash, cygdrive may be removed else start on /c/...
ghostscript=/cygdrive/c/program\ files/gs/gs9.22/bin/gswin32c

#set CV (Curriculum Vitae) file name
myresume=Miguel\ G.\ Quizon\ II\ CV\ 
docdir=files/
project_dir=$(pwd)

function ghost () {
	echo --------------------------------------------------------
	"$ghostscript" -dNOPAUSE -dBATCH -dSAFER -dQUIET -dPDFA=2 -dPDFACompatibilityPolicy=1 -dSimulateOverprint=true -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/screen -dEmbedAllFonts=true -dSubsetFonts=true -dAutoRotatePages=/None -dColorImageDownsampleType=/Bicubic -dColorImageResolution=150 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=150 -dMonoImageDownsampleType=/Bicubic -dMonoImageResolution=150 -sOutputFile="$myresume"$1 "$docdir"$1
}

cd $docdir
#store the filenames in array using globbing
files=(*)
cd $project_dir

#awesome :D
for file in "${files[@]}"; do
	ghost "$file"
done