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
    private let fetcher: UserFetcher
    var isLoading = false
    var errorMessage = ""
    var showingError = false
    
    init(fetcher: UserFetcher = UserFetcher()) {
        self.fetcher = fetcher
    }
    
    func loadUsers() async -> [User] {
        isLoading = true
        defer { isLoading = false }
        
        do {
            return try await fetcher.fetch()
        } catch {
            errorMessage = "There was an error: \(error.localizedDescription)"
            showingError = true
            return []
        }
    }
}
