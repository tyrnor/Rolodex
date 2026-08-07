//
//  UserFetcher.swift
//  Rolodex
//
//  Created by Carlos Yanez Puig on 07/08/2026.
//

import Foundation

struct UserFetcher {
    func fetch() async throws -> [User] {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode([User].self, from: data)
    }
}
