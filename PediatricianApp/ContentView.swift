//
//  ContentView.swift
//  PediatricianApp
//
//  Created by Dmitrii Nazarov on 27.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var selectedFilter = "По цене ↓"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                SearchBar(text: $searchText)
                
                CustomPicker(selectedFilter: $selectedFilter)
                
                Spacer()
            }
            .padding(.vertical)
            .navigationTitle("Педиатры")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}


#Preview {
    ContentView()
}


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

struct CustomPicker: View {
    @Binding var selectedFilter: String
    var filters = ["По цене ↓", "По стажу", "По рейтингу"]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(filters, id: \.self) { filter in
                Button(action: {
                    selectedFilter = filter
                }) {
                    Text(filter)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .foregroundColor(selectedFilter == filter ? .white : .gray)
                        .background(selectedFilter == filter ? Color.picker : Color(.systemGray6))
                }
            }
        }
        .frame(height: 40)
        .cornerRadius(8)
        .padding(.horizontal)
    }
}
