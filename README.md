# book_to_zines script

Utility script to convert a bigger PDF (think of a book) into a series of printable zines. 


## Configuration 

For now, manually change these variables...


```sh
FILE=input.pdf #name of PDF you want to want to zine-ify
INCREMENT=20 #this makes a 20/2=10 page zine (since it's printed double sided)
SHORTEDGE=1 # define this to apply --short-edge arg with pdfbook2 
```

## Dependencies 
- `cpdf` https://community.coherentpdf.com/
- `pdfbook2` https://github.com/jenom/pdfbook2

## Inspiration 

"Intro to pdfbook2" zine from Iffy Books https://iffybooks.net/wp-content/uploads/zines/Iffy_Books_pdfbook2_screen.pdf turned me on to `pdfbook2`