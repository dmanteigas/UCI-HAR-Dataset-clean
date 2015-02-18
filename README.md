# UCI-HAR-Dataset-clean
Coursera Assignment - Getting and Cleaning data

Hello everyone,

First of all, thank you for your kind review of this assignment. I'm not a profficient programmer, so I did my best to clean this messy dataset with the skills and time and have.
I'll appreciate all the comments you could give me in order to optimize the process. As you may notice, I had a problem with column classes, as R reads the values as factos or strings and not numerics even tough there is no missing data and all the values are of the same type. I would appreciate suggestions to deal with this problem quickly without having to perform that high level of transformations.
The code as it own legend, but I would like to highlight some questions that arise during the exercise so you could better understand my approach:

        1. I haven't changed the colnames of the final dataset. I thought of use a loop to past "mean of" in every colname, but I was not sure if that was required for the assignment as some measurements are means themselves. I decided to leave it as it was.
    	2. I left the "Activity_ID" column as a factor and not a string. I tried to read the final file and no problem arised from here and I believe that a factor would be a more appropriate class for future analysis than a string.
    	3. Be aware that the code is written considering that the folder "UCI HAR Dataset" is in your working directory, uncompressed. 
    	4. I tried to make the codebook as simple as possible. If this was a former data cleaning job I believe I should detail it better, but for this case it will surely fit the purpose.

Kind regards
