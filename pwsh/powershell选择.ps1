do { $myInput = (Read-Host 'Bla bla? (Y/N)').ToLower() } while ($myInput -notin @('y', 'n'))
if ($myInput -eq 'y') {
    'branch for yes'
}
else {
    'branch for no'
}
