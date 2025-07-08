//
//  DoctorFullDetailView.swift
//  PediatricianApp
//
//  Created by Dmitrii Nazarov on 31.12.2024.
//

import SwiftUI

struct DoctorFullDetailView: View {
    @ObservedObject var viewModel: DoctorFullDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                HStack(alignment: .top, spacing: 16) {
                    if let avatarURL = viewModel.avatarURL, let url = URL(string: avatarURL) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                        } placeholder: {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .foregroundColor(.gray)
                        }
                    } else {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .foregroundColor(.gray)
                    }
                    Text(viewModel.fullName)
                        .font(.title2)
                        .bold()
                }
                VStack(alignment: .leading, spacing: 10) {
                    
                    HStack(spacing: 18) {
                        Image(systemName: "clock")
                        Text("Опыт работы: \(viewModel.experience) лет")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    HStack(spacing: 16) {
                        Image(systemName: "briefcase")
                        
                        Text(viewModel.category)
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    HStack(spacing: 13) {
                        Image(systemName: "graduationcap")
                        Text("\(viewModel.education)".trimmingCharacters(in: .whitespacesAndNewlines))
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    HStack(spacing: 20) {
                        Image(systemName: "mappin.and.ellipse")
                        Text(viewModel.clinic)
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                }
                HStack {
                    Text("Стоимость услуг")
                        .font(.headline)
                    
                    Spacer()
                    Text(viewModel.servicePrice)
                        .font(.headline)
                        .bold()
                }
                .padding()
                .padding(.vertical, 10)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
                Text(viewModel.description)
                    .font(.body)
                    .foregroundColor(.gray)
                
                Spacer()
                Spacer()
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("Записаться")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.picker)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
            .padding()
        }
        .navigationTitle("Педиатр")
        .navigationBarTitleDisplayMode(.inline)
    }
}
