param(
[string]$PackageName = "ubuntu"
)

# Initialisieren Sie zunächst das Ergebnisobjekt
$ResultingObject = @()

# Nun machen Sie den Web-Aufruf zum Docker Hub
$result = Invoke-WebRequest -Uri "https://registry.hub.docker.com/v2/repositories/library/$PackageName/tags/?page_size=1250" 

# Konvertieren Sie dann den zurückgegebenen String in ein JSON Objekt:

$JsonObject = ConvertFrom-Json -InputObject $result.Content

# Aus diesem JSON Objekt lesen Sie das gewünschte Attribut aus:
$ResultingObject = $JsonObject.results

# Geben Sie zum Schluss die gefundenen Tags aus:
echo $ResultingObject.name 
