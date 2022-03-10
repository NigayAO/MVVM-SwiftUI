//
//  DataManager.swift
//  MVVM SwiftUI
//
//  Created by Alik Nigay on 11.03.2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    func getFavoriteState(for key: String) -> Bool {
        UserDefaults().bool(forKey: key)
    }
    
    func setFavoriteState(new value: Bool, key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
}
