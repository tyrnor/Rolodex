//
//  UserListView.swift
//  Rolodex
//
//  Created by Carlos Yanez Puig on 07/08/2026.
//

import SwiftData
import SwiftUI

struct UserListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    @State private var viewModel = UserListViewModel()
    
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    List(users) { user in
                        NavigationLink(value: user) {
                            HStack {
                                Text(user.name)
                                Spacer()
                                Circle()
                                    .fill(user.isActive ? .green : .red)
                                    .frame(width: 10, height: 10)
                            }
                        }
                    }
                    .navigationDestination(for: User.self, destination: { user in
                        UserDetailView(user: user)
                    })
                }
            }
            .navigationTitle("Rolodex")
        }
        .task {
            guard users.isEmpty else {return}
            let downloadedUsers = await viewModel.loadUsers()
            for user in downloadedUsers {
                modelContext.insert(user)
            }
        }
        .alert("Error", isPresented: $viewModel.showingError) {
            
        } message: {
            Text(viewModel.errorMessage)
        }
    }
}

#Preview {
    UserListView()
        .modelContainer(for: User.self, inMemory: true)
}
