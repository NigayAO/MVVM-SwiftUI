//
//  Course.swift
//  MVVM SwiftUI
//
//  Created by Alik Nigay on 10.03.2022.
//

import Foundation

struct Course: Codable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let numberOfLessons: Int?
    let numberOfTests: Int?
    
    init(value: [String: Any]) {
        id = value["id"] as? Int
        name = value["name"] as? String
        link = value["link"] as? String
        imageUrl = value["imageUrl"] as? String
        numberOfLessons = value["numberOfLessons"] as? Int
        numberOfTests = value["numberOfTests"] as? Int
    }
}
