# Import the Module 
Import-Module PSHTML

# Table representing the running processes with css
$proc = Get-Process | Where-Object {$_.ProcessName -ne ""} | Select-Object -Skip 20 -First 20
$css = 'body{background:#252525;font:87.5%/1.5em Lato,sans-serif;padding:20px}table{border-spacing:1px;border-collapse:collapse;background:#F7F6F6;border-radius:6px;overflow:hidden;max-width:800px;width:100%;margin:0 auto;position:relative}td,th{padding-left:8px}thead tr{height:60px;background:#367AB1;color:#F5F6FA;font-size:1.2em;font-weight:700;text-transform:uppercase}tbody tr{height:48px;border-bottom:1px solid #367AB1;text-transform:capitalize;font-size:1em;&:last-child {;border:0}tr:nth-child(even){background-color:#E8E9E8}'
html {
    head { 
        style {
            $css
        }
    }
    body {
        ConvertTo-PSHTMLTable -Object $proc -properties Id, Name, Handles, StartTime, WorkingSet
    }
}  | Out-File './HTMLtable.html'

# Display Result
& ./HTMLtable.html