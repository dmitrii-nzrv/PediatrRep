//
//  DoctorFullDetailViewModel.swift
//  PediatricianApp
//
//  Created by Dmitrii Nazarov on 31.12.2024.
//

import Foundation



class DoctorFullDetailViewModel: ObservableObject {
    @Published var fullName: String
    @Published var avatarURL: String?
    @Published var experience: Int
    @Published var category: String
    @Published var education: String
    @Published var clinic: String
    @Published var servicePrice: String
    @Published var description: String
    
    init(doctor: Doctor) {
        self.fullName = "\(doctor.last_name) \(doctor.first_name) \(doctor.patronymic)"
        self.avatarURL = doctor.avatar
        self.experience = doctor.seniority
        self.category = doctor.category_label
        self.education = doctor.higher_education.first?.university ?? "не указано"
        self.clinic = doctor.work_expirience.first?.organization ?? "не указано"
        self.servicePrice = "от \(doctor.video_chat_price) ₽"
        self.description = """
        Проводит диагностику и лечение терапевтических больных. \
        Осуществляет расшифровку и снятие ЭКГ. Даёт рекомендации по диетологии. \
        Доктор имеет опыт работы в России и за рубежом. Проводит консультации пациентов \
        на английском языке.
        """
    }
}

