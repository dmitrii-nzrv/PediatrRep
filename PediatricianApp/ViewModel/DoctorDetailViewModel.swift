//
//  DoctorDetailViewModel.swift
//  PediatricianApp
//
//  Created by Dmitrii Nazarov on 31.12.2024.
//

import Foundation

class DoctorDetailViewModel: ObservableObject {
    @Published var name: String
    @Published var services: [(title: String, description: String, price: String)]

    init(doctor: Doctor) {
        self.name = "\(doctor.first_name) \(doctor.last_name)"
        self.services = [
            (title: "Видеоконсультация", description: "30 min", price: "от \(doctor.video_chat_price) ₽"),
            (title: "Чат с врачом", description: "30 min", price: "от \(doctor.text_chat_price) ₽"), // Пример
            (title: "Приём в клинике", description: "В клинике", price: "от \(doctor.hospital_price) ₽") // Пример
        ]
    }
}
