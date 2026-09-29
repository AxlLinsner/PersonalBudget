# Personal Budget OS — iPhone/PWA Edition

This version is designed for Safari on iPhone.

IMPORTANT: iPhone Files cannot run a ZIP's HTML as a full web app. The app must be opened from a web server (HTTPS) for PWA features such as Add to Home Screen and offline caching.

Files:
- index.html — app
- manifest.webmanifest — PWA manifest
- sw.js — offline service worker
- icon-180.png / icon-512.png — Home Screen icons

To install on iPhone after hosting:
1. Open the HTTPS site in Safari.
2. Tap Share.
3. Tap Add to Home Screen.
4. Open Budget OS from the new Home Screen icon.

Your budgeting data is stored locally in the browser. This app does not request bank passwords or external account credentials.
