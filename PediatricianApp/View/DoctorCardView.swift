//
//  DoctorCardView.swift
//  PediatricianApp
//
//  Created by Dmitrii Nazarov on 29.12.2024.
//

import SwiftUI

import SwiftUI

struct DoctorCardView: View {
    var doctor: Doctor

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Верхняя часть: аватар, имя и избранное
            HStack(alignment: .top) {
                // Аватар
                if let avatarURL = doctor.avatar, let url = URL(string: avatarURL) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    } placeholder: {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .foregroundColor(.gray)
                    }
                } else {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .foregroundColor(.gray)
                }

                // Информация о враче
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(doctor.last_name) \(doctor.first_name) \(doctor.patronymic)")
                        .font(.headline)

                    Text("Стаж: \(doctor.seniority) лет")
                        .font(.subheadline)
                        .foregroundColor(.gray)

//                    if !doctor.specialization.isEmpty {
//                        Text(doctor.specialization.joined(separator: ", "))
//                            .font(.subheadline)
//                            .foregroundColor(.blue)
//                    }

                    // Рейтинг
                    HStack(spacing: 2) {
                        ForEach(0..<5) { index in
                            Image(systemName: index < Int(doctor.ratings_rating) ? "star.fill" : "star")
                                .resizable()
                                .frame(width: 14, height: 14)
                                .foregroundColor(.pink)
                        }
                    }
                }
                Spacer()

                // Иконка избранного
                Image(systemName: doctor.is_favorite ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(doctor.is_favorite ? .red : .gray)
            }

            // Цена
            Text("Цена: \(doctor.video_chat_price) ₽")
                .font(.headline)
                .foregroundColor(.black)

            // Кнопка записи
            Button("Записаться") {
                print("Запись к врачу \(doctor.last_name)")
            }
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.pink)
            .cornerRadius(10)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
        .padding(.horizontal)
    }
}
