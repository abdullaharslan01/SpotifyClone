//
//  Product.swift
//  SpotifyClone
//
//  Created by abdullah on 31.10.2024.
//

import Foundation

struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let brand: String?
    let sku: String
    let weight: Int
    let minimumOrderQuantity: Int
    let images: [String]
    let thumbnail: String
    
    var firstImage: String {
        images.first ?? Constants.randomImage
    }
    
    var _brand: String {
        brand ?? "N/A"
    }
    
}

enum AvailabilityStatus: String, Codable {
    case inStock = "In Stock"
    case lowStock = "Low Stock"
}



// MARK: - Dimensions
struct Dimensions: Codable {
    let width, height, depth: Double
}

// MARK: - Meta
struct Meta: Codable {
    let createdAt, updatedAt: CreatedAt
    let barcode: String
    let qrCode: String
}

enum CreatedAt: String, Codable {
    case the20240523T085621618Z = "2024-05-23T08:56:21.618Z"
    case the20240523T085621619Z = "2024-05-23T08:56:21.619Z"
    case the20240523T085621620Z = "2024-05-23T08:56:21.620Z"
}

enum ReturnPolicy: String, Codable {
    case noReturnPolicy = "No return policy"
    case the30DaysReturnPolicy = "30 days return policy"
    case the60DaysReturnPolicy = "60 days return policy"
    case the7DaysReturnPolicy = "7 days return policy"
    case the90DaysReturnPolicy = "90 days return policy"
}

struct Review: Codable {
    let rating: Int
    let comment: String
    let date: CreatedAt
    let reviewerName, reviewerEmail: String
}


struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
}

extension Product {
    static let mock = Product(id: 1, title: "Example product", description: "This is some mock product descpirit ", price: 99, discountPercentage: 15, rating: 4.5, stock: 50, brand: "Apple",  sku: "", weight: 2, minimumOrderQuantity: 3, images: [Constants.randomImage, Constants.randomImage], thumbnail: "")
}
