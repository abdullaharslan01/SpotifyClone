//
//  HomeView.swift
//  SpotifyClone
//
//  Created by abdullah on 02.11.2024.
//

import SwiftfulRouting
import SwiftfulUI
import SwiftUI

struct HomeView: View {
    
    @Environment(\.router) var router
    
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
                                .padding(.horizontal, 16)
                            
                            if let product = viewModel.products.first {
                                newReleaseSection(product: product)
                                    .padding(.horizontal, 16)
                            }
                            
                            listRows
                            
                        }
                        
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
    RouterView { _ in
        
        HomeView()
    }
}

extension HomeView {
    
    private var listRows: some View {
        ForEach(viewModel.productRows) { row in
            VStack(spacing: 8) {
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.scWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                                                                            
                ScrollView(.horizontal) {
                                                                            
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(row.products) { product in
                            SCImageTitleRowCell(titleRowCellModel: ImageTitleRowModel(imageSize: 100, imageName: product.firstImage, title: product.title))
                                .asButton(.press) {
                                    goToPlayListView(product: product)
                                }
                                                                                    
                        }
                    }.padding(.horizontal, 16)
                                                                            
                }.scrollIndicators(.hidden)
            }
        }
    }
    
    private func newReleaseSection(product: Product) -> some View {
        SCNewReleaseCell(
            newReleaseCellModel: NewReleaseCellModel(
                imageName: product.firstImage,
                headline: product.brand,
                subheadline: product.id.description,
                title: product.title,
                subtitle: product.description,
                onAddToPlayListPressed: {},
                onPlayPressed: {
                    goToPlayListView(product: product)
                }
            )
        )
    }
    
    private var recentsSection: some View {
        LazyVGrid(columns: recentsCellGridItems, spacing: 10) {
            ForEach(viewModel.products) { product in
                                           
                SCRecentsCell(imageName: product.firstImage, title: product.title)
                    .asButton(.press) {
                        goToPlayListView(product: product)
                    }
                                            
            }
        }
    }
    
    private func goToPlayListView(product: Product) {
        
        guard let currentUser = viewModel.currentUser else { return }
        
        router.showScreen(.push) { _ in
            
            PlayListView(product: product, user: currentUser)
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
                        
            ZStack {
                if let user = viewModel.currentUser {
                                                
                    ImageLoaderView(urlString: user.image)
                                  
                        .background(.scWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            router.dismissScreen()
                        }
                }
            }.frame(width: 35, height: 35)
                        
            ScrollView(.horizontal) {
                            
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SCCategoryCell(title: "\(category.rawValue.capitalized)", isSelected: viewModel.selectedCategory == category)
                            .onTapGesture {
                                viewModel.selectedCategory = category
                                
                                // I am simulating just show that buttons actions.
                                Task {
                                    await viewModel.getAllProducts()
                                }
                            }
                    }
                }.padding(.horizontal, 16)
                            
            }.scrollIndicators(.hidden)
                        
        }.padding(.vertical, 24)
            .padding(.leading, 8)
            .background(Color.scBlack)
        
    }
}
