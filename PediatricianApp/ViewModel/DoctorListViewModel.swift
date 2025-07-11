//
//  DoctorListViewModel.swift
//  PediatricianApp
//
//  Created by Dmitrii Nazarov on 29.12.2024.
//

import SwiftUI

class DoctorListViewModel: ObservableObject {
    @Published var doctors: [Doctor] = []
    @Published var searchText: String = ""
    @Published var selectedFilter: String = "По цене ↓"
    @Published var isAscending: Bool = false
    
    func toggleFavorite(doctorId: String) {
        if let index = doctors.firstIndex(where: { $0.id == doctorId }) {
            doctors[index].is_favorite.toggle()  // Переключаем состояние "избранного"
        }
    }
    
    init() {
        loadDoctors()
    }
    
    func loadDoctors() {
        if let loadedDoctors = loadDoctorsFromJSON() {
            self.doctors = loadedDoctors
        } else {
            print("Failed to load doctors from JSON")
        }
    }
    
    var filteredDoctors: [Doctor] {
        let filtered = doctors.filter {
            searchText.isEmpty || "\($0.last_name) \($0.first_name) \($0.patronymic)"
                .localizedCaseInsensitiveContains(searchText)
        }
        switch selectedFilter {
        case "По цене":
            return filtered.sorted { isAscending ? $0.video_chat_price < $1.video_chat_price : $0.video_chat_price > $1.video_chat_price }
        case "По стажу":
            return filtered.sorted { isAscending ? $0.seniority < $1.seniority : $0.seniority > $1.seniority }
        case "По рейтингу":
            return filtered.sorted { isAscending ? $0.ratings_rating < $1.ratings_rating : $0.ratings_rating > $1.ratings_rating }
        default:
            return filtered
        }
        
        func toggleSortOrder() {
            isAscending.toggle()
        }
    }
}

