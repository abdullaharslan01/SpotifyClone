//
//  PlaylistHeaderCell.swift
//  SpotifyClone
//
//  Created by abdullah on 04.11.2024.
//

import SwiftfulUI
import SwiftUI

struct PlaylistHeaderCell: View {
    
    var playListHeaderCellModel: PlayListHeaderCellModel
    var shadowColor: Color = .scBlack.opacity(0.8)
    var height:CGFloat = 300
    var body: some View {
        
        Rectangle()
            .opacity(0)
            .overlay(
                ImageLoaderView(urlString: playListHeaderCellModel.imageName)
            )
        
            .overlay(alignment: .bottomLeading, content: {
                VStack(alignment: .leading, spacing: 8) {
                    Text(playListHeaderCellModel.subtitle)
                        .font(.headline)
                                    
                    Text(playListHeaderCellModel.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .foregroundStyle(.scWhite)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(colors: [shadowColor.opacity(0), shadowColor], startPoint: .top, endPoint: .bottom)
                )
            })
            .asStretchyHeader(startingHeight: height)
        
    }
}

#Preview {
    ZStack {
        Color.scBlack.ignoresSafeArea()
        
        ScrollView {
            PlaylistHeaderCell(playListHeaderCellModel: PlayListHeaderCellModel.MOCK)
        }.ignoresSafeArea()
        
    }
}

struct PlayListHeaderCellModel {
    var title: String
    var subtitle: String
    var imageName: String
}

extension PlayListHeaderCellModel {
    static let MOCK = PlayListHeaderCellModel(title: "Some playlist title goes here", subtitle: "Subtitle goes here", imageName: Constants.randomImage)
}
