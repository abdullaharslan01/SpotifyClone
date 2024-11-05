//
//  PlayListView.swift
//  SpotifyClone
//
//  Created by abdullah on 04.11.2024.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct PlayListView: View {
    
    @Environment(\.router) var router
    
    var product: Product = .mock
    var user: User = .mock
    @State private var products: [Product] = []
    @State private var showHeader: Bool = false
    @State private var offset: CGFloat = 0
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Color.scBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    
                    
                        PlaylistHeaderCell(
                            playListHeaderCellModel: .init(
                                title: product.title,
                                subtitle: product._brand,
                                imageName: product.firstImage
                            )
                        ).readingFrame { frame in
                            offset = frame.maxY
                            showHeader = frame.maxY < 150 ? true : false
                        }
                    
            
                    PlayListDescriptionCell(descriptionText: product.description, userName: user.username, subheadline: user.email, onAddToPlaylistPressed: nil, onDownloadPressed: nil, onSharePressed: nil, onEllipsisPressed: nil, onShufflePressed: nil, onPlayPressed: nil)
                        .padding(.horizontal, 16)
                    
                    ForEach(products) { product in
                        
                        SCSongRowCell(
                            imageSize: 50,
                            imageName: product.firstImage,
                            title: product.title,
                            subtitle: product.brand
                        ) {} onEllipsisPressed: {}

                            .padding(.leading, 16)
                    }
                    
                }
               
            }
            
            ZStack {
                Text(product.title)
                    .font(.headline)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(Color.scBlack)
                    .offset(y: showHeader ? 0 : -40)
                    .opacity(showHeader ? 1 : 0)
                
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .padding(10)
                    .background(showHeader ? Color.black.opacity(0.001) : Color.scGray.opacity(0.7))
                    .clipShape(Circle())
                    .onTapGesture {
                        router.dismissScreen()
                    }
                    .padding(.leading, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .foregroundStyle(.scWhite)
            .animation(.smooth(duration: 0.2), value: showHeader)
            .frame(maxWidth: .infinity, alignment: .top)
            
            
        }.task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            
            products = try await DatabaseHelper.getProducts()
            
        } catch {}
    }
    
}

#Preview {
    PlayListView()
}
