//
//  Vacancy.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 11.04.2024.
//

import Foundation


struct Root: Decodable {
    let vacancies: [Vacancy]
}

struct Vacancy: Decodable, Identifiable {
    let id: String 
    let lookingNumber: Int?
    let title: String
    let address: Address
    let company: String
    let experience: Experience
    let publishedDate: String?
    var isFavorite: Bool 
    let salary: Salary
    let schedules: [String]
    let appliedNumber: Int?
    let description: String?
    let responsibilities: String
    let questions: [String]
    
    struct Salary: Decodable {
        let full: String?
        let short: String?
    }
    
    struct Address: Decodable {
        let town: String
        let street: String
        let house: String
        var description: String {
            "\(town), \(street), \(house)"
        }
    }
    struct Experience: Codable {
        let text: String
        let previewText: String
    }
}


