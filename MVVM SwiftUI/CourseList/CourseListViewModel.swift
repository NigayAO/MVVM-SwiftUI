//
//  CourseListViewModel.swift
//  MVVM SwiftUI
//
//  Created by Alik Nigay on 10.03.2022.
//

import Foundation

class CourseListViewModel: ObservableObject {
    @Published var rows: [CourseDetailsViewModel] = []
    
    func fetchCourses() async {
        do {
            let courses = try await NetworkManager.shared.fetchData()
            rows = courses.map { CourseDetailsViewModel(course: $0) }
        } catch {
            print(error)
        }
    }
}
