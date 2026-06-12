
$Files = Get-ChildItem

$FilesCount = $Files.Count

Write-Host "The total number of files: $FilesCount"

$SortedFiles = $Files |
Sort-Object Length -Descending |
Select-Object -First 5

Write-Host "The largest files are:"

$SortedFiles | Select-Object Name, Length | Format-Table

$Report = $Files |
Select-Object Name, Length, Extension, LastWriteTime

New-Item -ItemType Directory -Path "reports" -Force

$Report |
Export-Csv -Path "reports\FileReport.csv" 

Write-Host "Report exported successfully."
