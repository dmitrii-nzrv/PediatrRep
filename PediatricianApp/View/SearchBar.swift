//
//  SearchBar.swift
//  PediatricianApp
//
//  Created by Dmitrii Nazarov on 29.12.2024.
//


import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Поиск", text: $text)
        }
        .padding(12)
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}
