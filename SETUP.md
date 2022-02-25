To create a new encrypted file use the following:

```gpg --quiet --batch --yes --passphrase=${PASSPHRASE} --output ${TARGET.gpg} --symmetric ${SOURCE}```
