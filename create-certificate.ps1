# 1) Create a code-signing cert in your user store
$cert = New-SelfSignedCertificate `
    -Type CodeSigningCert `
    -Subject 'CN=github@Este2013, O=github@Este2013,  C=FR' `
    -CertStoreLocation 'Cert:\CurrentUser\My'

# 2) Export a PFX (private key) for signing in CI
$pwd = ConvertTo-SecureString 'StrongPasswordHere' -AsPlainText -Force
Export-PfxCertificate -Cert $cert -FilePath .\certs\myapp.pfx -Password $pwd

# 3) Export the public CER to install on test machines (trust anchor)
Export-Certificate -Cert $cert -FilePath .\certs\myapp.cer