//
//  Doctor.swift
//  PediatricianApp
//
//  Created by Dmitrii Nazarov on 29.12.2024.
//

import Foundation

struct DoctorResponse: Codable {
    let record: Record
}

struct Record: Codable {
    let data: DataSection
}

struct DataSection: Codable {
    let users: [Doctor]
}

struct Doctor: Identifiable, Codable {
    let id: String
    let first_name: String
    let last_name: String
    let patronymic: String
    let avatar: String?
    let ratings_rating: Double
    let seniority: Int
    let video_chat_price: Int
    
    let text_chat_price: Int
    let hospital_price: Int
    
    
    var is_favorite: Bool
    let specialization: [Specialization]
    let gender_label: String
    let rank_label: String
    let category_label: String
    let nearest_reception_time: Int?
}

struct Specialization: Codable {
    let name: String
}
