//
//  UserListView.swift
//  Rolodex
//
//  Created by Carlos Yanez Puig on 07/08/2026.
//

import SwiftUI

struct UserListView: View {
    @State private var viewModel = UserListViewModel()
    
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    List(viewModel.users) { user in
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
                        
                    })
                }
            }
            .navigationTitle("Rolodex")
        }
        .task {
            await viewModel.loadUsers()
        }
        .alert("Error", isPresented: $viewModel.showingError) {
            
        } message: {
            Text(viewModel.errorMessage)
        }
    }
}

#Preview {
    UserListView()
}
