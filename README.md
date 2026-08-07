# 📇 Rolodex
A simple contact directory app built with SwiftUI, where you can browse a list of people, see who's currently active, and tap into a profile to check out their details and friends — even offline.

## How it works
- Browse a list of users fetched from a remote API.
- See at a glance who's active right now.
- Tap a user to view their full profile: age, company, email, address, bio, tags, and friends.
- Data is fetched once and persisted locally, so the app works offline after the first launch.

## Built with
- Swift
- SwiftUI
- `URLSession` + `async`/`await` for networking
- Custom `Codable` conformance (manual `init(from:)` / `encode(to:)`) on SwiftData `@Model` classes
- SwiftData (`@Model`, `@Query`, `ModelContext`) for local persistence
- `@Observable` for view-model state management
- `NavigationLink(value:)` / `navigationDestination` for navigation

## Why I built this
This project started as a milestone challenge in a SwiftUI learning path: fetch JSON from the network, decode it, and display it with a navigation stack. A follow-up "scope creep" challenge then asked for the app to work offline, which meant reworking the data layer to use SwiftData — including writing custom `Codable` conformance by hand, since `@Model` classes don't get it synthesized automatically. It's a small app, but it touches the kind of networking, persistence, and refactoring work that comes up constantly in real iOS development.
