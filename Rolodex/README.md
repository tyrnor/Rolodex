# 📇 Rolodex
A simple contact directory app built with SwiftUI, where you can browse a list of people, see who's currently active, and tap into a profile to check out their details and friends.

## How it works
- Browse a list of users fetched from a remote API.
- See at a glance who's active right now.
- Tap a user to view their full profile: age, company, email, address, bio, tags, and friends.
- Pull to refresh and fetch the latest data.
- Data only loads once per session, so you're not re-downloading every time you open the list.

## Built with
- Swift
- SwiftUI
- `URLSession` + `async`/`await` for networking
- `Codable` for decoding JSON, including ISO-8601 dates
- `@Observable` for view-model state management
- `NavigationLink(value:)` / `navigationDestination` for navigation

## Why I built this
This project was built as a milestone challenge in a SwiftUI learning path, meant to be built from scratch without step-by-step guidance. It focuses on tying together networking, JSON decoding, and navigation into a small but complete app — the kind of bread-and-butter work that shows up in real iOS development.
