# Detect Vulnerabilities in Images
## Detect Vulnerabilities in the image

Build the image `docker build --no-cache -t krol/demo-trivy:main-fdf2a30 -f Dockerfile .` or `make build`

Run the scanner `trivy image krol/demo-trivy:main-fdf2a30` or `make scan-image`

