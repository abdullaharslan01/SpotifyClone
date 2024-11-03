//
//  SCCategoryCell.swift
//  SpotifyClone
//
//  Created by abdullah on 02.11.2024.
//

import SwiftUI

struct SCCategoryCell: View {

    var title: String = "All"
    var isSelected: Bool = false

    var body: some View {
        Text(self.title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColors(isSelected: isSelected)
            .cornerRadius(16)

    }
}

extension View {
    func themeColors(isSelected: Bool) -> some View {
        self.background(isSelected ? .scGreen : .scDarkGray)
            .foregroundStyle(isSelected ? .scBlack : .scWhite)
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
