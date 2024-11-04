//
//  PlayListDescriptionCell.swift
//  SpotifyClone
//
//  Created by abdullah on 04.11.2024.
//

import SwiftUI

struct PlayListDescriptionCell: View {
    
    var descriptionText: String = Product.mock.description
    
    var userName: String = "Abdullah"
    var subheadline: String = "Some headline goes here"
    var onAddToPlaylistPressed: (()->Void)? = nil
    var onDownloadPressed: (()->Void)? = nil
    var onSharePressed: (()->Void)? = nil
    var onEllipsisPressed: (()->Void)? = nil
    var onShufflePressed: (()->Void)? = nil
    var onPlayPressed: (()->Void)? = nil
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text(descriptionText)
                .frame(maxWidth: .infinity, alignment: .leading)
          
            madeForYouSection
            
            Text(subheadline)
            
            buttonsRow
            
        }
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.scLightGray)
        
    }
    
    private var buttonsRow: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {}
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {}
                            
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {}
                            
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {}
            }.offset(x: -8)
                .frame(maxWidth: .infinity, alignment: .leading)
                        
            HStack(spacing: 8) {
                Image(systemName: "shuffle")
                    .font(.system(size: 24))
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {}
                            
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 46))
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {}
                            
            }.foregroundStyle(.scGreen)
                        
        }.font(.title2)
    }
    
    private var madeForYouSection: some View {
        HStack(spacing: 8) {
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundStyle(.scGreen)
                                    
            Text("Made for ")
                +
                Text(userName)
                .bold()
                .foregroundStyle(.scWhite)
                        
        }
    }
    
}

#Preview {
    ZStack {
        Color.scBlack.ignoresSafeArea()
        
        PlayListDescriptionCell()
            .padding()
    }

}
