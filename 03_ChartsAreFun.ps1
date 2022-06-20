# Install the Module
Import-Module PSHTML

# Generate some charts

$PieCanvasID = "Piecanvas"
$PolarCanvasID = "Polarcanvas"
$radarcanvasID = "radarcanvas"
$DoughnutCanvasID = "doughnutcanvas"
$HTMLPage = html { 
    head {
        title 'PSHTML Chart Demonstration'

    }
    body {

        h1 "PSHTML Graph"

        div {

            p {
                "This is a Pie graph"
            }
            canvas -Height 400px -Width 400px -Id $PieCanvasID {

                script -src "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js" -type "text/javascript"


                script -content {
        
                    $Data1 = @(34,7,11,19)
        
                    $Labels = @("Closed","Unresolved","Pending","Open")
        
                    $colors = @("Lightgreen","red","Blue","Yellow")
                    $dsb1 = New-PSHTMLChartPieDataSet -Data $data1 -label "March" -BackgroundColor $Colors
        
                    New-PSHTMLChart -type Pie -DataSet $dsb1 -title "Ticket Statistics" -Labels $Labels -CanvasID $PieCanvasID
                }

                

            }

        }

        div {

            p {
                "This is a PolarCanvas graph"
            }
            canvas -Height 400px -Width 400px -Id $PolarCanvasID {

            script -src "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js" -type "text/javascript"

            script -content {

                $Labels      = @('January',   'February', 'Mars',     'April', 'Mai',       'June',   'July',    'August',      'September', 'October', 'November', 'december')
                $Colors      = @('red',       'Cyan',     'DarkCyan', 'green', 'DarkGreen', 'yellow', 'Orange',  'grey',        'DarkGrey',  'blue',    'Magenta',  'DarkMagenta')
                $HoverColors = @('DarkGreen', 'yellow',   'Orange',   'grey',  'DarkGrey',  'blue',   'Magenta', 'DarkMagenta', 'red',       'Cyan',    'DarkCyan', 'green' )
                $Data1       = @(17,          25,         18,         17,      10,           28,      35,         50,           44,          10,        32,         72)

                $dsb1 = New-PSHTMLChartPolarAreaDataSet -Data $data1 -BackgroundColor $Colors -hoverBackgroundColor $HoverColors

                New-PSHTMLChart -type polarArea -DataSet $dsb1 -title  'PolarArea Chart Example' -Labels $Labels -CanvasID $PolarCanvasID
            }

            }


        }

        div {

            p {
                "This is a radarcanvas graph"
            }
            canvas -Height 400px -Width 400px -Id $radarCanvasID {

            script -src "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js" -type "text/javascript"

            script -content {
    
                $Labels = @("January","February","Mars","April","Mai","June","July","August","September","October","November","december")
                $dsb1 = @() 
    
                $Data1 = @(17,25,18,17,22,30,35,44,4,1,6,12)
                $dsb1 += New-PSHTMLChartBarDataSet -Data $data1 -label "2018" -borderColor (get-pshtmlColor -color blue) -backgroundColor "transparent" -hoverBackgroundColor (get-pshtmlColor -color green)
                $Data2 = @(4,1,6,12,17,25,18,17,22,30,35,44)
                $dsb1 += New-PSHTMLChartBarDataSet -Data $data2 -label "2019" -borderColor (get-pshtmlColor -color red) -backgroundColor "transparent" -hoverBackgroundColor (get-pshtmlColor -color yellow)
    
                New-PSHTMLChart -type radar -DataSet $dsb1 -title "Radar Chart Example" -Labels $Labels -CanvasID $radarCanvasID
    
            }

                

            }

        }

        div {

            p {
                "This is a radarcanvas graph"
            }
            canvas -Height 400px -Width 400px -Id $DoughnutCanvasID {

            script -src "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js" -type "text/javascript"


            script -content {
    
                $Data1 = @(34,7,11,19)
    
    
                $colors = @("LightGreen","Red","LightBlue","LightYellow")
                $dsd1 = New-PSHTMLChartDoughnutDataSet -Data $data1 -label "March" -backgroundcolor $colors -hoverbackgroundColor $Colors
    
                New-PSHTMLChart -type doughnut -DataSet @($dsd1) -title "Doughnut Chart v2" -Labels $Labels -CanvasID $DoughnutCanvasID
    
    
            }

                

            }

        }
    }
}


$OutPath = "./PieChart.html"
$HTMLPage | out-file -FilePath $OutPath -Encoding utf8
& './PieChart.html'