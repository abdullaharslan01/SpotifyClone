//
//  SCSongRowCell.swift
//  SpotifyClone
//
//  Created by abdullah on 05.11.2024.
//

import SwiftUI

struct SCSongRowCell: View {
    
    var imageSize: CGFloat = 50
    var imageName: String = Constants.randomImage
    
    var title: String = "Some "
    var subtitle: String? = "Some artists name"
    
    var onCellPressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    
    var body: some View {
        
        HStack(spacing: 8) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.scWhite)
                
                if let subtitle {
                    Text(subtitle)
                        .font(.callout)
                        .foregroundStyle(.scLightGray)
                }
            }
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundStyle(.scWhite)
                .padding(16)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    onEllipsisPressed?()
                }
            
        }
        .foregroundStyle(.scWhite)
    }
}

#Preview {
    ZStack {
        Color.scBlack.ignoresSafeArea()
        
        VStack {
            SCSongRowCell()
            SCSongRowCell()
            SCSongRowCell()
            SCSongRowCell()
        }}
}
