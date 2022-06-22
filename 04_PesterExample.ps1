# Install the Modules
Import-Module PSHTML
Import-Module Pester

$PesterResult = Invoke-Pester /Users/kevin/code/github.com/PSHarmonize/Tests -PassThru

$css = 'body{background:#F7FAFE;font:87.5%/1.5em Lato,sans-serif;padding:20px}table{border-spacing:1px;border-collapse:collapse;background:#E8EAED;border-radius:6px;overflow:hidden;max-width:800px;width:100%;margin:0 auto;position:relative}td,th{padding-left:8px}thead tr{height:60px;background:#367AB1;color:#F5F6FA;font-size:1.2em;font-weight:700;text-transform:uppercase}tbody tr{height:48px;border-bottom:1px solid #367AB1;text-transform:capitalize;font-size:1em;&:last-child {;border:0}tr:nth-child(even){background-color:#E8E9E8}'
$DoughnutCanvasID = "doughnutcanvas"

$HTMLPage = html {
    head { 
        style {
            $css
        }
    }
    body {

        Header {
            h1 "This is a Pester Report for the Powershell Module PSHarmonize" -Style "text-align:center"
            div {
                p {
                    "See here the test results."   
                }

                canvas -Height 400px -Width 400px -Id $DoughnutCanvasID {

                    script -src "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js" -type "text/javascript"
        
        
                    script -content {
            
                        $Data1 = @($($PesterResult.PassedCount),$($PesterResult).FailedCount)
            
            
                        $colors = @("LightGreen","Red")
                        $dsd1 = New-PSHTMLChartDoughnutDataSet -Data $data1 -label "PesterResult" -backgroundcolor $colors -hoverbackgroundColor $Colors
            
                        New-PSHTMLChart -type doughnut -DataSet @($dsd1) -title "PSHarmonize Doughnut chart" -Labels $Labels -CanvasID $DoughnutCanvasID
            
            
                    }
        
                        
        
                    } -Style "margin: 0 auto; display: block;"

            } -Style "text-align:center"
        }



        ConvertTo-PSHTMLTable -Object $PesterResult.TestResult -properties Context, Result, Time, FailureMessage
    }
}  

$OutPath = "./PesterReport.html"
$HTMLPage | out-file -FilePath $OutPath -Encoding utf8
& './PesterReport.html'