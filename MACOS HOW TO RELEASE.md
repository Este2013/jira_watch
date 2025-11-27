macOS is a damn pain.


### Clean build and sign fresh (on the build Mac)

On your build Mac:

```
flutter clean
flutter build macos --release
cd build/macos/Build/Products/Release
```

Now sign once, at the top level, after everything is built.

### If you have a Developer ID cert (best)

Check the available identities:

```security find-identity -p codesigning -v```


Pick your Developer ID Application identity, then:

```
codesign --force --deep --options runtime \
  --sign "Developer ID Application: Your Name (TEAMID)" \
  jira_watch.app

BETTER?
codesign --force --deep --options runtime \
  --preserve-metadata=entitlements \
  --sign "Apple Development: cesteban112@gmail.com (637C656Q22)" \
  jira_watch.app
```

If you’re just testing between your own Macs (ad-hoc)

```codesign --force --deep --sign - jira_watch.app```


Now verify on the build Mac:

```
codesign --verify --deep --strict --verbose=2 jira_watch.app
spctl --assess --type execute -vv jira_watch.app
```

You want no errors and (ideally) accepted from spctl.

If ```codesign --verify``` already complains about Info.plist, then something on the build side is still changing it (post-build script, manual edit, etc.).

2. Zip the app properly (use ditto!)

Regular zip is usually fine, but ditto is what Apple recommends and avoids weird edge cases with metadata.

On the build Mac:

```
cd build/macos/Build/Products/Release
ditto -c -k --keepParent jira_watch.app jira_watch.zip
```

Then send jira_watch.zip to the other Mac.

(If you were right-clicking → Compress in Finder, that also uses ditto under the hood and is fine.)