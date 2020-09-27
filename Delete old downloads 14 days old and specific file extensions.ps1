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



