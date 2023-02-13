# CopyFilesScript
<!-- wp:paragraph -->
<p>During my time at GE Digital as a Software Engineering Intern for Summer 2021 I was tasked with writing some PowerShell scripts to automate the process of software deployments.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>One script I created was used to copy the contents of one folder to another folder to automate the process of continually updating data on multiple servers. I can share this script because it does not involve anything GE-specific and can be used to transfer data between folders on any windows machine.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>How it works:</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Simply run the script and it will prompt the user for the source folder and destination folder. It checks to see if the source folder exists, and if it doesn't the script will exit and the user must re-run it. If the destination folder already exists, the script makes a copy of the current destination folder as a redundant measure to preserve data in case of error. Then a new destination folder is created using the name the user typed in, and the files are copied over from the source folder to destination folder.</p>
<!-- /wp:paragraph -->
