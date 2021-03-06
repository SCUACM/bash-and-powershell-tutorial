# Paul Ahrens
# Bash and PowerShell Workshop

# String parameter for path
Param(
  [string]$path1,
  [string]$path2
)

If(!$path1) {
  "Missing path argument! Exiting..."
  Exit
}

<#

Get the content of the file at path, then pipe 
it to a cmdlet to measure the number of lines

#>

#Get-Content -Path $path1 | Measure-Object -Line

$counts = @()

If($path2) {
  Set-Location -Path $path2
  $files = Get-ChildItem -recurse
  foreach ($file in $files) {
    $counts+=Get-Content $file | Measure-Object -Line
  }
  Set-Location -Path ..
}

$total = 0
foreach($number in $counts.Lines) {
 $total++
}

"Total lines: $total"
