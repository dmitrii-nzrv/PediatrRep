//
//  DoctorDetailView.swift
//  PediatricianApp
//
//  Created by Dmitrii Nazarov on 31.12.2024.
//

import SwiftUI

struct DoctorDetailView: View {
    @ObservedObject var viewModel: DoctorDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Стоимость услуг")
                .font(.title2)
                .bold()
                .padding(.bottom, 10)
            
            // Перебираем массив услуг
            ForEach(0..<viewModel.services.count, id: \.self) { index in
                let service = viewModel.services[index]
                ServiceRow(title: service.title, description: service.description, price: service.price)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle(viewModel.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ServiceRow: View {
    var title: String
    var description: String
    var price: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            HStack {
                Text(description)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(price)
                    .bold()
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
        }
    }
}
