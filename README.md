# UOL Map

A UIKit coursework app for browsing New Brighton murals on a map, viewing artwork and artist details, and saving favourites with Core Data. It also includes a University of Liverpool campus walk for simulated location updates.

## Open the project

1. Open `UserLocation.xcodeproj` in Xcode with an iOS 16.1 or newer simulator installed.
2. Choose the **UserLocation** scheme and an iPhone simulator, then run.
3. Allow location access to see distance and user tracking. The shared scheme includes `UserLocation/UoL campus walk.gpx` for simulation; choose another location if you want to explore New Brighton.

For a physical device, select your own signing team and bundle identifier in the target settings.

## What is here

- `UserLocation/`: UIKit controllers, storyboards, networking models, Core Data stack and mural model.
- `Murals+CoreDataClass.swift` and `Murals+CoreDataProperties.swift`: existing managed-object declarations referenced by the project.
- `reference/Model.xcdatamodeld`: additional model recovered from the original repository; not part of the app target.

The Xcode project and data models were restored from their original ZIP archives. Source files now occupy the paths expected by the project. Editor state and duplicate archives were removed; the original revisions remain in Git history. The missing asset-catalog structure was reconstructed with the supplied accent colour metadata and an empty app-icon slot; no original icon artwork was present.

## Status and limitations

This is a preserved coursework prototype, not a production app. Mural records and images depend on the University of Liverpool teaching service at `cgi.csc.liv.ac.uk`; availability has not been verified and no offline seed dataset is included. Mural ordering tolerates unavailable locations and invalid coordinates; results and table updates are published on the main queue. The older persistence refresh still uses a timed insert and records the refresh date before network completion, so persistence and offline/error behaviour need further work.

Project references, property lists, JSON and XML resources have been checked locally. An iOS build and simulator run have **not** been completed: the validation machine has Command Line Tools rather than full Xcode, and its Swift toolchain also reports a duplicate `SwiftBridging` module. App Store icon artwork and signing configuration are still required for distribution.

## Credits

Original coursework authorship is preserved in the source headers, including Phil Jimmieson's teaching material and Mohammed Abdullah Alotaibi's work. No new licence is imposed; consult the original authors before reusing material beyond the permissions already granted.

## Automated checks

Run `python3 scripts/validate_resources.py` for portable resource checks. GitHub Actions runs this check and attempts unsigned iOS Simulator builds on macOS. These workflows have not yet been run remotely; successful local resource checks do not establish that an iOS build passes.

Focused Swift regression checks run with `python3 scripts/test_logic.py` on macOS and in a separate GitHub Actions job. They test the shared logic used by the app, without requiring an iOS simulator.
