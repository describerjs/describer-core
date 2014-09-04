CD "%1"
mklink /d node_modules c:\w\node_modules
"C:\Program Files\nodejs\node.exe" c:\npm\node_modules\grunt-cli\bin\grunt
rmdir node_modules