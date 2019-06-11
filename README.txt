####################################################################################
#
#     The R scrip in this map is used to create the IMWe personal evaluation file.
#
#     Last edited: 11. 6. 2019
#     Edited by: Blaž
#
#     You'll need R and R Studio on your computer to run the script.	
#
####################################################################################

Teamers should use google forms to submit their answers as much as possible, so that all data is in google sheets.
Forms are separated in 3 different questionares because of our very long answers and google form's max character limit.

The map with the scipt should contain:
      - .httr-oauth file
      - .png pictures with teamers
      - "Personal evaluation IMWe.docx" file
      - R script (obviously)

In order for the script to run without errors you need to provide png pictures for every teamer that also has a "What would you like to say to ..." question in the forms. The picture size is not that important, because the  script imports it with the width of 350 px. It should however be cropped and rectangular. It helps if the face of the teamer is clearly visible (first plan).

When the script runs, there will be 1 new file created in the map: "evaluation.Rmd". Open it in R Studio and press the Knit button, or press Ctrl+Shift+K. 

An "evaluation.docx" file should be created in the map and opened. Copy everything by pressing Ctrl+A and Ctrl+C. 

Open the "Personal evaluation IMWe.docx" file and paste everything before the start of the old content on page numbered with 1 (probably page 4).

Delete the old content.

Edit the document - grammar, spacing, move pictures ...

Edit the first page.

Refresh the Table of content and change the group photo bellow it.

Change the year in the header of the pages.

Save and close the document.

Push changes to git.
