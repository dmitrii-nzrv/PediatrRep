//
//  CustomPicker.swift
//  PediatricianApp
//
//  Created by Dmitrii Nazarov on 29.12.2024.
//

import SwiftUI

struct CustomPicker: View {
    @Binding var selectedFilter: String
    var filters = ["По цене", "По стажу", "По рейтингу"]
    @Binding var isAscending: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(filters, id: \.self) { filter in
                Button(action: {
                    if selectedFilter == filter {
                        isAscending.toggle()
                    } else {
                        selectedFilter = filter
                        isAscending = false
                    }
                }) {
                    Text("\(filter) \(selectedFilter == filter ? (isAscending ? "↑" : "↓") : "")")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .foregroundColor(selectedFilter == filter ? .white : .gray)
                        .background(selectedFilter == filter ? Color.picker : Color(.systemGray6))
                        .cornerRadius(8)
                }
            }
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}


