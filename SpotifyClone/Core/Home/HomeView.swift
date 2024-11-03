//
//  HomeView.swift
//  SpotifyClone
//
//  Created by abdullah on 02.11.2024.
//

import SwiftUI

@Observable
class HomeViewModel {
    
    var currentUser: User?
    
    var selectedCategory: Category
    
    init() {
        selectedCategory = .all
    }
    
    func getCurrentUser() async {
        
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
            
            ScrollView(.vertical) {
                
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders]) {
                    
                    Section {
                        ForEach(0 ..< 20) { _ in
                            Rectangle()
                                .frame(width: 150, height: 150)
                        }
                    } header: {
                        header
                    }

                }.padding(.top, 8)
                
            }.scrollIndicators(.hidden)
                .clipped()
          
        }.task {
            await viewModel.getCurrentUser()
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
}

#Preview {
    HomeView()
}

extension HomeView {
    
    private var header: some View {
        HStack(spacing: 0) {
                        
            ZStack {
                if let user = viewModel.currentUser {
                                                
                    ImageLoaderView(urlString: user.image)
                                  
                        .background(.scWhite)
                        .clipShape(Circle())
                        .onTapGesture {}
                }
            }.frame(width: 35, height: 35)
                        
            ScrollView(.horizontal) {
                            
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SCCategoryCell(title: "\(category.rawValue.capitalized)", isSelected: viewModel.selectedCategory == category)
                            .onTapGesture {
                                viewModel.selectedCategory = category
                            }
                    }
                }.padding(.horizontal, 16)
                            
            }.scrollIndicators(.hidden)
                        
        }.padding(.vertical, 24)
            .padding(.leading, 8)
            .background(Color.scBlack)
    }
}
