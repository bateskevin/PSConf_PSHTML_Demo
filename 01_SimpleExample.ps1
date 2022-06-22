# Install the Module
Install-Module PSHTML 

# Import the Module 
Import-Module PSHTML

$ErrorActionPreference = "Stop"
$Numbers = 1..5

# Simple HTML example
html {

    head{

        title "woop title"
        link "css/normalize.css" "stylesheet"
    }

    body{

        Header {
            h1 "This is h1 Title in header"
            div {
                p {
                    "This is simply a paragraph in a div."
                }
            }
        }

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

} 

# Simple HTML example output to file
html {

    head{

        title "woop title"
        link "css/normalize.css" "stylesheet"
    }

    body{

        Header {
            h1 "This is h1 Title in header"
            div {
                p {
                    "This is simply a paragraph in a div."
                }
            }
        }

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

} | Out-File './example.html'

# Display Result
& './example.html'