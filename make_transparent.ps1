Add-Type -AssemblyName System.Drawing
$imgPath = "e:\app of bimomass\the university of haripur.png"
$imgDest = "e:\app of bimomass\the university of haripur_transparent.png"
$bmp = [System.Drawing.Bitmap]::FromFile($imgPath)
$bmpOut = New-Object System.Drawing.Bitmap($bmp.Width, $bmp.Height)

for ($y = 0; $y -lt $bmp.Height; $y++) {
    for ($x = 0; $x -lt $bmp.Width; $x++) {
        $c = $bmp.GetPixel($x, $y)
        if ($c.R -gt 240 -and $c.G -gt 240 -and $c.B -gt 240) {
            $bmpOut.SetPixel($x, $y, [System.Drawing.Color]::Transparent)
        } else {
            $bmpOut.SetPixel($x, $y, $c)
        }
    }
}
$bmpOut.Save($imgDest, [System.Drawing.Imaging.ImageFormat]::Png)
$bmpOut.Dispose()
$bmp.Dispose()
Write-Host "Done"
