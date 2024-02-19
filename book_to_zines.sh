#!/bin/bash

FILE=input.pdf # name of PDF you want to want to zine-ify
INCREMENT=40   # this makes a 40/2=20 page zine (since it's printed double sided)
SHORTEDGE=1    # define this to apply --short-edge arg with pdfbook2 
OUTPUTDIR="$FILE-zines"

rm -rf $OUTPUTDIR
mkdir "$OUTPUTDIR"
echo "Splitting $FILE into chunks of $INCREMENT pages"
 ./cpdf $FILE -split -chunk $INCREMENT -o ./"$OUTPUTDIR"/%%%.pdf

cd $OUTPUTDIR

echo "Creating booklets from chunks for printing..."

if [ -z ${SHORTEDGE+x} ]; 
	then 
		pdfbook2 *; 
else 
	pdfbook2 * --short-edge; 
fi


echo "Deleting non booklet files"
find . -type f \! -name "*book*" -delete

echo "Script complete..."
ls -l
