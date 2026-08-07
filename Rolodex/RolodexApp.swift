//
//  RolodexApp.swift
//  Rolodex
//
//  Created by Carlos Yanez Puig on 07/08/2026.
//

import SwiftData
import SwiftUI

@main
struct RolodexApp: App {
    var body: some Scene {
        WindowGroup {
            UserListView()
        }
        .modelContainer(for: User.self)
    }
}
