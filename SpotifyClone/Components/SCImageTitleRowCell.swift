//
//  SCImageTitleRowCell.swift
//  SpotifyClone
//
//  Created by abdullah on 04.11.2024.
//

import SwiftUI

struct SCImageTitleRowCell: View {
    
    var titleRowCellModel: ImageTitleRowModel

    var body: some View {
       
        VStack(alignment: .leading, spacing: 8) {
            
            ImageLoaderView(urlString: titleRowCellModel.imageName)
                .frame(width: titleRowCellModel.imageSize, height: titleRowCellModel.imageSize)
            
            Text(titleRowCellModel.title)
                .font(.callout)
                .foregroundStyle(.scLightGray)
                .lineLimit(2)
                .padding(4)
        }.frame(width: titleRowCellModel.imageSize)
    }
}

#Preview {
    ZStack {
        
        Color.scBlack.ignoresSafeArea()
        
        SCImageTitleRowCell(titleRowCellModel: ImageTitleRowModel.MOCK )
    }
}


struct ImageTitleRowModel {
    var imageSize:CGFloat
    var imageName:String
    var title:String
}

extension ImageTitleRowModel {
    static let MOCK = ImageTitleRowModel(imageSize: 100, imageName: Constants.randomImage, title: "Some Item Name")
}
