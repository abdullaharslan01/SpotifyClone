//
//  HomeViewModel.swift
//  SpotifyClone
//
//  Created by abdullah on 04.11.2024.
//

import Foundation

@Observable
class HomeViewModel {
    
    var currentUser: User?
    
    var selectedCategory: Category
    
    var products: [Product] = []
    
    var productRows: [ProductRow] = []
    
    init() {
        selectedCategory = .all
    }
    
    func getCurrentUser() async {
        
        do {
            currentUser = try await DatabaseHelper.getOneUser()
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    func getAllProducts() async {
            
        do {
     
            products = try await Array(DatabaseHelper.getProducts().shuffled().prefix(6))
            
            var rows: [ProductRow] = []

            let allBrands = Set(products.map { $0.brand })
            
            for brand in allBrands {
                // The api send datas less that's why I don't use filter.
                //    let products = self.products.filter { $0.brand == brand }
                
                rows.append(ProductRow(title: brand?.capitalized ?? "NA", products: products))
            }
            
            productRows = rows
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}
