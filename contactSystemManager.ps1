# Initialize an empty array for the contact book
$global:contactBook = @()

# Define a custom object for contacts
function New-Contact {
    param(
        [string]$Name,
        [string]$PhoneNumber,
        [string]$Email
    )
    return [PSCustomObject]@{
        Name = $Name
        PhoneNumber = $PhoneNumber
        Email = $Email
    }
}

# Function to add a contact to the contact book
function Add-Contact {
    param(
        [string]$Name,
        [string]$PhoneNumber,
        [string]$Email
    )
    $contact = New-Contact -Name $Name -PhoneNumber $PhoneNumber -Email $Email
    $global:contactBook += $contact
}

# Function to remove a contact from the contact book by name
function Remove-Contact {
    param(
        [string]$Name
    )
    $global:contactBook = $global:contactBook | Where-Object { $_.Name -ne $Name } 
}

# Function to list all contacts in the contact book
function List-Contacts {
    foreach ($contact in $global:contactBook) {
        Write-Output "Name: $($contact.Name), PhoneNumber: $($contact.PhoneNumber), Email: $($contact.Email)"
    }
}

# Function to seek a contact by the Name
function Find-Contact {
    param(
        [string]$Name
    )
    $contact = $global:contactBook | WhereObject { $_.Name -eq $Name }
    if ($contact) {
        return $contact
    } else {
        return "Contact not found"
    }
}

# Function to clear all contacts from the contact book
function Clear-Contacts {
    $global:contactBook = @()
}