//
//  PlayListView.swift
//  SpotifyClone
//
//  Created by abdullah on 04.11.2024.
//

import SwiftUI

struct PlayListView: View {
    
    var product: Product = .mock
    var user:User = .mock
    
    var body: some View {
        
        ZStack {
            Color.scBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
            
                    PlaylistHeaderCell(
                        playListHeaderCellModel: .init(
                            title: product.title,
                            subtitle: product._brand,
                            imageName: Constants.randomImage
                        )
                    )
                    
                    PlayListDescriptionCell(descriptionText: product.description, userName: user.username, subheadline: user.email, onAddToPlaylistPressed: nil, onDownloadPressed: nil, onSharePressed: nil, onEllipsisPressed: nil, onShufflePressed: nil, onPlayPressed: nil)
                        .padding(.horizontal, 16)
                }
            }
        }
    }
}

#Preview {
    PlayListView()
}
