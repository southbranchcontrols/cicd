To create a new encrypted file use the following:

```gpg --quiet --batch --yes --passphrase=${PASSPHRASE} --symmetric ${SOURCE} --output ${TARGET.gpg}```
