//
//  Trash.swift
//  SpotifyClone
//
//  Created by abdullah on 02.11.2024.
//

import SwiftUI

struct Trash: View {
    var body: some View {
        ZStack {
            
            Color.yellow.ignoresSafeArea()
            
            ScrollView {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    
                    Section {
                        
                        ForEach(0..<50) { no in
                            Text(no.description)
                        }
                        
                    } header: {
                        
                        Text("Lakes")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .background(Color.scGreen)
                    }
                    
                    Section {
                        
                        ForEach(0..<50) { no in
                            Text(no.description)
                            
                        }
                        
                    } header: {
                        
                        Text("Mountains")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .background(Color.scGreen)
                        
                    }
                    
                    Section {
                        
                        ForEach(0..<10) { no in
                            Text(no.description)
                            
                        }
                        
                    } header: {
                        
                        Text("Rivers")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .background(Color.scGreen)
                    }
                }
            }.clipped()
                .toolbarVisibility(.visible, for: .navigationBar)
            
        }
    }
}

#Preview {
    Trash()
}
