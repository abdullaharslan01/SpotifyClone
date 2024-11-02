//
//  HomeView.swift
//  SpotifyClone
//
//  Created by abdullah on 02.11.2024.
//

import SwiftUI

@Observable
class HomeViewModel {
    
    var currentUser: User? = nil
    
    var selectedCategory: Category
    
    init() {
        selectedCategory = .all
    }
    
     func getCurrentUser() async{
        
        do {
            currentUser = try await DatabaseHelper.getOneUser()
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}



struct HomeView: View {
    @State var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color.scBlack.ignoresSafeArea()
            
            HStack {
                
                if let user = viewModel.currentUser {
                    
                    ImageLoaderView(urlString: user.image)
                        .frame(width: 30, height: 30)
                        .background(.scWhite)
                        .clipShape(Circle())
                        .onTapGesture {}
                }
                
                ScrollView(.horizontal) {
                    
                    
                    HStack(spacing: 8) {
                        ForEach(Category.allCases, id: \.self) { category in
                            SCCategoryCell(title: "\(category.rawValue.capitalized)", isSelected: viewModel.selectedCategory == category)
                                .onTapGesture {
                                    viewModel.selectedCategory = category
                                }
                        }
                    }
                    
                    
                    
                }.scrollIndicators(.hidden)
                
                
                
                
            }
        }.task {
             await viewModel.getCurrentUser()
        }
    }
}

#Preview {
    HomeView()
}
