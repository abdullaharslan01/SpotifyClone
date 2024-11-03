//
//  HomeView.swift
//  SpotifyClone
//
//  Created by abdullah on 02.11.2024.
//

import SwiftfulUI
import SwiftUI

@Observable
class HomeViewModel {
    
    var currentUser: User?
    
    var selectedCategory: Category
    
    var products: [Product] = []
    
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
    
    func getAllProducts() async {
            
        do {
     
            products = try await Array(DatabaseHelper.getProducts().shuffled().prefix(6))
            
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}

struct HomeView: View {
    @State var viewModel = HomeViewModel()
    private var recentsCellGridItems: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        ZStack {
            Color.scBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders]) {
                    
                    Section {
                        VStack(spacing: 25) {
                            recentsSection
                            
                            if let product = viewModel.products.first {
                                newReleaseSection(product: product)
                            }
                            
                        }.padding(.horizontal, 16)
                        
                    } header: {
                        header
                    }

                }.padding(.top, 8)
                
            }.scrollIndicators(.hidden)
                .clipped()
          
        }.task {
            await viewModel.getCurrentUser()
            await viewModel.getAllProducts()
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
}

#Preview {
    HomeView()
}

extension HomeView {
    
    private func newReleaseSection(product: Product) -> some View {
        SCNewReleaseCell(
            newReleaseCellModel: NewReleaseCellModel(
                imageName: product.firstImage,
                headline: product.brand,
                subheadline: product.price.description,
                title: product.title,
                subtitle: product.description,
                onAddToPlayListPressed: {},
                onPlayPressed: {}
            )
        )
    }
    
    private var recentsSection: some View {
        LazyVGrid(columns: recentsCellGridItems, spacing: 10) {
            ForEach(viewModel.products) { product in
                                           
                SCRecentsCell(imageName: product.firstImage, title: product.title)
                                            
            }
        }
    }
    
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
