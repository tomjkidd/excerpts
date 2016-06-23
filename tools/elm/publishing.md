# Publish an already existing Elm lib

```shell
elm-package diff
elm-package bump
git add elm-package.json
git commit -m "Release X.Y.X"
git push
git tag -a 1.1.1 -m "Release X.Y.Z"
git push --tags
elm-package publish
```

The diff will allow you to see API changes. Bump will update pacakges.json
to include the correct version. Since this introduces a change, use git
to add, commit, and push, using the version name that elm-package changed
to. Finally, tag the release and push the tag so that elm-package can
point to the release.
