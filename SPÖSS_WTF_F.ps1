$name = "SPÖSS"
$Global:spelarpoäng = 0
$Global:datorpöang = 0

Write-Output "Välkommen att spela $name!

Skriv:
1 för Sten (Sten slår Sax och Ödla)
2 för Sax (Sax slår Papper och Ödla)
3 för Papper (Papper slår Sten och Spock)
4 för Ödla (Ödla slår Papper och Spock)
5 för Spock (Spock slår Sten och Sax)

Lycka till!
"
while ($spelarpoäng -ne 5 -and $datorpöang -ne 5)
 {
  
    $valavdator = Get-Random -Minimum 1 -Maximum 6

    $spelarval = Read-Host "Ange tal"
    $spelarval = [int]$spelarval

    if ($spelarval -lt 1 -or $spelarval -gt 5) {
        Write-Host "Fel. Skriv 1, 2, 3, 4 eller 5"
        continue
    }

    $vinnare = ""
    if ($spelarval -eq $valavdator) {
        $vinnare = "Remi"
    }
    elseif (($spelarval -eq 1 -and $valavdator -eq 2) -or
            ($spelarval -eq 2 -and $valavdator -eq 3) -or
            ($spelarval -eq 3 -and $valavdator -eq 1) -or
            ($spelarval -eq 4 -and $valavdator -eq 3) -or
            ($spelarval -eq 5 -and $valavdator -eq 1) -or
            ($spelarval -eq 1 -and $valavdator -eq 4) -or
            ($spelarval -eq 2 -and $valavdator -eq 4) -or
            ($spelarval -eq 3 -and $valavdator -eq 5) -or
            ($spelarval -eq 4 -and $valavdator -eq 5) -or
            ($spelarval -eq 5 -and $valavdator -eq 2)) {
        $vinnare = "Du vann."
        $spelarpoäng++
    }
    else {
        $vinnare = "Dator vann."
        $datorpöang++
    }

    
    Write-Host "Dator val: $valavdator"
    Write-Host -f Yellow "Vinnare: $vinnare"
    Write-Host -f blue "Resultat: $spelarpoäng-$datorpöang"



    if (($spelarpoäng -eq 5 -and $datorpöang -eq 0) -or
    ($spelarpoäng -eq 4 -and $datorpöang -eq 1) -or 
    ($spelarpoäng -eq 3 -and $datorpöang -eq 2)) {
    Write-Host -f Red "Grattis, du vann! Resultat: $spelarpoäng-$datorpöang"
    break
}
elseif (($datorpöang -eq 5 -and $spelarpoäng -eq 0) -or
    ($datorpöang -eq 4 -and $spelarpoäng -eq 1) -or
    ($datorpöang -eq 3 -and $spelarpoäng -eq 2)) {
    Write-Host -f Red "Tyvärr, förlorade du. Resultat: $spelarpoäng-$datorpöang"
    break
}
 }