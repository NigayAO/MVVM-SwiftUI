//
//  ContentView.swift
//  MVVM SwiftUI
//
//  Created by Alik Nigay on 10.03.2022.
//

import SwiftUI

struct CourseListView: View {
    @StateObject private var viewModel = CourseListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.rows, id: \.courseName) { courseDetailsVM in
                NavigationLink(destination: CourseDetailsView(viewModel: courseDetailsVM)) {
                    RowView(viewModel: courseDetailsVM)
                }
            }
            .navigationTitle("Courses")
        }
        .task {
            await viewModel.fetchCourses()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
