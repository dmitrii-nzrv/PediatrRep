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
    
    let scientific_degree_label: String
    let higher_education: [HigherEducation]
    let work_expirience: [WorkExperience]
    
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

struct HigherEducation: Codable {
    let id: Int
    let university: String
    let specialization: String
    let qualification: String
    let start_date: Int
    let end_date: Int?
    let until_now: Bool
}

struct WorkExperience: Codable {
    let id: Int
    let organization: String
    let position: String
    let start_date: Int
    let end_date: Int?
    let until_now: Bool
}
