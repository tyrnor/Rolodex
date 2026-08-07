//
//  UserListViewModel.swift
//  Rolodex
//
//  Created by Carlos Yanez Puig on 07/08/2026.
//

import Foundation
import Observation

@Observable
class UserListViewModel {
    var users = [User]()
    private let fetcher: UserFetcher
    var errorMessage = ""
    var showingError = false
    
    init(fetcher: UserFetcher = UserFetcher()) {
        self.fetcher = fetcher
    }
    
    func loadUsers() async {
        if users.isEmpty {
            do {
                users = try await fetcher.fetch()
            } catch {
                print("Can't fetch users: \(error.localizedDescription)")
                errorMessage = "There was an error: \(error.localizedDescription)"
                showingError = true
            }
        }
    }
}
