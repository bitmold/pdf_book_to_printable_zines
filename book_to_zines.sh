#!/bin/bash



FILE=input.pdf
COUNTER=1
INCREMENT=20
SHORTEDGE=1
OUTPUTDIR="$FILE-zines"

rm -rf $OUTPUTDIR
mkdir "$OUTPUTDIR"
echo "Splitting $FILE into $INCREMENT chunks"
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
