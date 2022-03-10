//
//  CourseDetailsViewModel.swift
//  MVVM SwiftUI
//
//  Created by Alik Nigay on 10.03.2022.
//

import Foundation

class CourseDetailsViewModel: ObservableObject {
    var courseName: String {
        course.name
    }
    
    var imageData: Data {
        var imageData = Data()
        do {
            imageData = try NetworkManager.shared.fetchImage(course.imageUrl)
        } catch {
            print(error)
        }
        return imageData
    }
    
    var numberOfLessons: String {
        "Number of lessons: \(course.numberOfLessons)"
    }
    
    var numberOfTests: String {
        "Number of tests: \(course.numberOfTests)"
    }
    
    @Published var isFavorite: Bool {
        didSet {
            DataManager.shared.setFavoriteState(new: isFavorite, key: course.name)
        }
    }
    
    private let course: Course
    
    init(course: Course) {
        self.course = course
        isFavorite = DataManager.shared.getFavoriteState(for: course.name)
        
    }
    
    func favoriteButtonPressed() {
        isFavorite.toggle()
    }
}
