//
//  SCNewReleaseCell.swift
//  SpotifyClone
//
//  Created by abdullah on 03.11.2024.
//

import SwiftUI

struct SCNewReleaseCell: View {

    var newReleaseCellModel: NewReleaseCellModel

    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                ImageLoaderView(urlString: newReleaseCellModel.imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 2) {
                    if let headline = newReleaseCellModel.headline {
                        Text(headline)
                            .foregroundStyle(.scLightGray)
                            .font(.callout)
                           
                    }
                    if let subHeadline = newReleaseCellModel.subheadline {
                        Text(subHeadline)
                            .foregroundStyle(.scLightGray)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.scWhite)
                    }
                }

            }.frame(maxWidth: .infinity, alignment: .leading)

            HStack {
                ImageLoaderView(urlString: newReleaseCellModel.imageName)
                    .frame(width: 140, height: 140)

                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 2) {
                        if let title = newReleaseCellModel.title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.scWhite)
                                .padding(.top, 5)
                                .lineLimit(8)
                        }

                        if let subtitle = newReleaseCellModel.subtitle {
                            Text(subtitle)
                                .foregroundStyle(.scLightGray)
                        }
                    }.font(.callout)

                    HStack(spacing: 0) {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.scLightGray)
                            .font(.title3)
                            .padding(4)
                            .background(Color.black.opacity(0.001))
                            .onTapGesture {
                                newReleaseCellModel.onAddToPlayListPressed?()
                            }
                            .offset(x: -4)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.scLightGray)
                            .font(.title)
                            .onTapGesture {
                                newReleaseCellModel.onPlayPressed?()
                            }
                    }
                }
                .padding(.trailing, 16)

            }
            .themeColors(isSelected: false)
            .cornerRadius(8)

        }
    }
}

#Preview {

    ZStack {
        Color.scBlack.ignoresSafeArea()
        SCNewReleaseCell(newReleaseCellModel: NewReleaseCellModel(imageName: Constants.randomImage, headline: "New release from", subheadline: "Some Artist", title: "Some Playlist", subtitle: "Single - Title"))
            .padding()
    }

}

struct NewReleaseCellModel {
    var imageName: String
    var headline: String?
    var subheadline: String?
    var title: String?
    var subtitle: String?
    var onAddToPlayListPressed: (()-> Void)? = nil
    var onPlayPressed: (()->Void)? = nil
    
}
