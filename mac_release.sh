#! /bin/bash

# 1) Build
# flutter build macos --release

cd build/macos/Build/Products/Release

APP="jira_watch.app"   # change this

# 2) (Optional but often helpful) strip any existing weird signatures
# This may produce warnings on frameworks; that's fine.
find "$APP" -name "*.dylib" -o -name "*.so" -o -name "*.framework" -o -name "$APP" | while read f; do
  codesign --remove-signature "$f" 2>/dev/null || true
done

# 3) Re-sign app, frameworks and plugins with an ad-hoc signature,
# preserving entitlements so your permissions still work.
codesign --force --deep \
  --sign - \
  --options runtime \
  --preserve-metadata=entitlements,requirements,flags,runtime \
  "$APP"

# 4) Sanity-check (you'll probably see "rejected (not notarized)" in spctl, that's OK)
spctl --assess --verbose "$APP" || true

# TO RUN: sh macos/sign_and_zip.sh
