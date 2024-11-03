//
//  SCRecentsCell.swift
//  SpotifyClone
//
//  Created by abdullah on 03.11.2024.
//

import SwiftUI

struct SCRecentsCell: View {
    
    var imageName: String = Constants.randomImage
    var title: String = "Some random Title uieauiea uiea   aa + ++ +++ +"
    
    var body: some View {
        
        HStack(spacing: 16) {
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
                .truncationMode(.tail)
                .frame(maxWidth: .infinity, alignment: .leading)
               
        }
        .padding(.trailing, 8)
        .themeColors(isSelected: false)
        .cornerRadius(6)
            
    }
}

#Preview {
    ZStack {
        
        Color.scBlack.ignoresSafeArea()
        
        VStack {
            HStack(spacing: 10) {
                SCRecentsCell()
            }.padding(.vertical, 8)
                .padding(.horizontal, 1)
            HStack(spacing: 10) {
                SCRecentsCell()
                SCRecentsCell()
            }
        }
    }
}
