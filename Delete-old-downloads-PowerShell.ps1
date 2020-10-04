#-------------------------------------------------
#-------Delete old downloads automatically--------
#-------------------------------------------------
# Automatically delete files older than 14 days 
# from your downloads directory with this 
# PowerShell script.
#
# Script written by Luke Gackle
# https://lukestoolkit.blogspot.com/2020/10/automatically-delete-old-downloads-powershell.html
#-------------------------------------------------

 
 #Specify the number of days the files have to be before they are deleted by this script
 $comparison = (get-date).adddays(-14)

Get-ChildItem "C:\Users\$([Environment]::UserName)\Downloads" -Recurse | foreach($_){
if([datetime]($_.LastWriteTime) -lt $comparison){
    Remove-Item ($_.FullName)
}
else {
    #For particular file types, remove them regardless of age
    if(($_.Extension) -contains ".pdf" -or ($_.Extension) -contains ".jpg" -or ($_.Extension) -contains ".dat"){
        Remove-Item ($_.FullName)
    }
}
}



