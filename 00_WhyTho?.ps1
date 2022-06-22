Import-Module PSHTML

# Simple examples
p "this is a paragraph"


# HTML in Powershell
html {
    head {
        title "woop title"
        link "css/normalize.css" "stylesheet"
    }

    body {
        p "Once again a paragraph"
    }

    footer {
        p "closing"
    }
}


# Powershell Logic in HTML
$ErrorActionPreference = "Stop"
$Numbers = 1..5


html {
    head {
        title "woop title"
        link "css/normalize.css" "stylesheet"
    }

    body {
        foreach($number in $Numbers){
            try{
                if($number -lt 3){
                    throw "Number is to low"
                }
                p "Number: $($number) is high enough"
            }catch{
                p "Number: $($number) is to low"
            }
            
        }
    }

    footer {
        p "closing"
    }
}