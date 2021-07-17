# CopyFilesScript
During my time at GE as a Digital Intern for Summer 2021 I was tasked with writing a simple PowerShell script to copy the contents of one folder to another folder to automate the process of manually updating the contents of folders on many servers.

<!-- wp:paragraph -->
<p><strong>How it works:</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Simply run the script and it will prompt the user for the source folder and destination folder. It checks to see if the source folder exists, and if it doesn't the script will exit and the user must re-run it. If the destination folder already exists, the script makes a copy of the current destination folder as a redundant measure to preserve data in case of error. Then a new destination folder is created using the name the user typed in, and the files are copied over from the source folder to destination folder.</p>
<!-- /wp:paragraph -->
