//
//  ContentView.swift
//  SpotifyClone
//
//  Created by abdullah on 31.10.2024.
//

import SwiftfulRouting
import SwiftfulUI
import SwiftUI

struct ContentView: View {
    
    @State private var users: [User] = []
    @State private var product: [Product] = []
    
    @Environment(\.router) var router
    
    var body: some View {
        ScrollView {
            VStack {
                
                ForEach(product) { user in
                    Text(user.title ?? "")
                        
                }.onTapGesture {
                    router.showScreen(.push) { _ in
                        Text("Another Screen")
                    }
                }
                
            }
            .task {
                await getData()
            }
        }
    }
    
    private func getData() async {
        do {
            
            users = try await DatabaseHelper.getUsers()
            product = try await DatabaseHelper.getProducts()
            
        } catch {}
    }
}

#Preview {
    ContentView()
}
