//
//  CourseDetailsView.swift
//  MVVM SwiftUI
//
//  Created by Alik Nigay on 10.03.2022.
//

import SwiftUI

struct CourseDetailsView: View {
    @StateObject var viewModel: CourseDetailsViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.courseName)
                .font(.largeTitle)
            VStack(alignment: .leading, spacing: 20) {
                ZStack {
                    CourseImage(
                        imageData: viewModel.imageData,
                        imageSize: CGSize(width: 230, height: 180),
                        cornerRadius: 30,
                        shadowIsOn: true
                    )
                    FavoriteButton(isFavorite: viewModel.isFavorite) {
                        viewModel.favoriteButtonPressed()
                    }
                }
                Text(viewModel.numberOfLessons)
                    .font(.headline)
                Text(viewModel.numberOfTests)
                    .font(.headline)
            }
            Spacer()
        }
    }
}

struct FavoriteButton: View {
    let isFavorite: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(isFavorite ? .red : .gray)
        }
        .offset(x: 115, y: 60)
    }
}

struct CourseDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailsView(viewModel: CourseDetailsViewModel(course: Course.getCourse()))
    }
}
