//
//  User.swift
//  SpotifyClone
//
//  Created by abdullah on 31.10.2024.
//

import Foundation
struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let bloodGroup: String
    let height, weight: Double
    let eyeColor: String
    let ip: String
    let macAddress, university: String
    let ein, ssn, userAgent: String
}

extension User {
    static let mock = User(id: 1, firstName: "Abdullah", lastName: "Arslan", maidenName: "", age: 24, email: "abdullaharslan1473@gmail.com", phone: "", username: "abdullaharslan01", password: "", birthDate: "", image: "", bloodGroup: "", height: 1, weight: 1, eyeColor: "", ip: "", macAddress: "", university: "", ein: "", ssn: "", userAgent: "")
}
