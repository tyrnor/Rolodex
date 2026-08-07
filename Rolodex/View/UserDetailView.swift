//
//  UserDetailView.swift
//  Rolodex
//
//  Created by Carlos Yanez Puig on 07/08/2026.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        Form {
            Section("Personal Information") {
                LabeledContent("Age", value: "\(user.age)")
                LabeledContent("Company", value: user.company)
                LabeledContent("Email", value: user.email)
                LabeledContent("Address", value: user.address)
            }
            
            Section("About") {
                Text(user.about)
            }
            
            Section("Registered") {
                Text(user.registered, format: .dateTime.day().month().year())
            }
            
            Section("Tags") {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 8) {
                    ForEach(user.tags.indices, id: \.self) { index in
                        Text(user.tags[index])
                            .font(.subheadline)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(.blue.opacity(0.15))
                            .clipShape(Capsule())
                    }
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
            
            Section("Friends") {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }
        }
        .scrollBounceBehavior(.basedOnSize)
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let testUser = User(
        id: "1",
        isActive: true,
        name: "Test User",
        age: 22,
        company: "Test Company",
        email: "test@test.test",
        address: "Test Address",
        about: "Test About",
        registered: .now,
        tags: ["test", "test"],
        friends: [Friend(id: "2", name: "Test Friend")])
    
    UserDetailView(user: testUser)
}
