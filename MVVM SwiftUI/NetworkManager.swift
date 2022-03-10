//
//  NetworkManager.swift
//  MVVM SwiftUI
//
//  Created by Alik Nigay on 10.03.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private let api = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    
    private init() {}
    
    func fetchData() async throws -> [Course] {
        
        guard let url = URL(string: api) else {
            throw NetworkError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let courses = try? decoder.decode([Course].self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return courses
    }
    
    func fetchImage(_ url: String) async throws -> Data {
        
        guard let imageURL = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        guard let data = try? Data(contentsOf: imageURL) else {
            throw NetworkError.noData
        }
        return data
    }
}
