//
//  SCCategoryCell.swift
//  SpotifyClone
//
//  Created by abdullah on 02.11.2024.
//

import SwiftUI

struct SCCategoryCell: View {
    
    
    var title:String = "Music"
    var isSelected:Bool = false
    
    
    var body: some View {
        Text(title)
            .font(.callout)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .background(isSelected ? .scGreen : .scDarkGray)
            .foregroundStyle(isSelected ? .scBlack : .scWhite)
            .cornerRadius(16)
    }
}

#Preview {
    ZStack {
        Color.scBlack.ignoresSafeArea()
        VStack(spacing: 40) {
            SCCategoryCell(title: "All")
            SCCategoryCell(title: "Music", isSelected: true)
            SCCategoryCell(title: "Title goes here", isSelected: true)
     
        }
        
    }
}
