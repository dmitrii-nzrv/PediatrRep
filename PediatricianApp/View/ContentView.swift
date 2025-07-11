//
//  ContentView.swift
//  PediatricianApp
//
//  Created by Dmitrii Nazarov on 29.12.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DoctorListViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 16) {
                SearchBar(text: $viewModel.searchText)
                CustomPicker(selectedFilter: $viewModel.selectedFilter, isAscending: $viewModel.isAscending)
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(viewModel.filteredDoctors) { doctor in
                            DoctorCardView(viewModel: viewModel, doctorId: doctor.id)
                        }
                    }
                }
                
                .background(Color(.systemGray6))
                Spacer()
            }
            .navigationTitle("Педиатры")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
