# BatchColor
Colored text in batch files!
ONLY WORKS ON WINDOWS 10


# Color File Syntax:
call ColorText.bat 0a "Hello World" /n /u

0a             = The HEX color code (just like you would use with the color command) for more info run color -help
"Hello World"  = The text you want to display
/n             = This option forces the text to not create a new line, so the next line of text will be on the same line as what you echo.
/u             = Underline the text

# Color Function Syntax:
call :color 0a "Hello World" /n /u

0a             = The HEX color code (just like you would use with the color command) for more info run color -help
"Hello World"  = The text you want to display
/n             = This option forces the text to not create a new line, so the next line of text will be on the same line as what you echo.
/u             = Underline the text

# Which should I use?

Try and use the function as it is much easier. If you start getting weird errors it is due to a windows function bug (happens especially on very large files) and you should switch to the file.
You can add the file seamlessly into your code using the Into-Batch program found here: https://github.com/ITCMD/Into-Batch
