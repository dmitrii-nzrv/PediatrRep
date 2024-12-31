//
//  DoctorCardView.swift
//  PediatricianApp
//
//  Created by Dmitrii Nazarov on 29.12.2024.
//
import SwiftUI

struct DoctorCardView: View {
    @ObservedObject var viewModel: DoctorListViewModel
    var doctorId: String
    
    var doctor: Doctor? {
        viewModel.doctors.first { $0.id == doctorId }  // Извлекаем модель врача из ViewModel
    }
  
    var body: some View {
        guard let doctor = doctor else { return AnyView(EmptyView()) }  // Если врач не найден, не показываем представление
        
        return AnyView(  // Возвращаем представление, если врач найден
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .top) {
                    if let avatarURL = doctor.avatar, let url = URL(string: avatarURL) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                //.scaledToFill()
                                .scaledToFill()
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
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading, spacing: 4){
                            Text("\(doctor.last_name) ")
                                .font(.headline)
                            Text("\(doctor.first_name) \(doctor.patronymic)")
                                .font(.headline)
                        }
                        
                        HStack(spacing: 2) {
                            ForEach(0..<5) { index in
                                Image(systemName: index < Int(doctor.ratings_rating) ? "star.fill" : "star")
                                    .resizable()
                                    .frame(width: 14, height: 14)
                                    .foregroundColor(.pink)
                            }
                        }
                        
                        Text("\(doctor.specialization.first?.name ?? "Не указана") ・ Стаж: \(doctor.seniority) лет")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("Цена: \(doctor.video_chat_price) ₽")
                            .font(.headline)
                            .foregroundColor(.black)
                        
                    }
                    Spacer()

                    // Кнопка для изменения избранного
                    Button(action: {
                        viewModel.toggleFavorite(doctorId: doctor.id)  // Вызываем метод в ViewModel
                    }) {
                        Image(systemName: doctor.is_favorite ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(doctor.is_favorite ? .red : .gray)
                    }
                    .padding()
                }

// 
                NavigationLink(destination: DoctorDetailView(viewModel: DoctorDetailViewModel(doctor: doctor))) {
                    Text(doctor.nearest_reception_time == nil ? "Нет свободного времени" : "Записаться")
                        .font(.headline)
                        .foregroundColor(doctor.nearest_reception_time == nil ? .black : .white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(doctor.nearest_reception_time == nil ? Color.myGray : Color.picker)
                        .cornerRadius(10)
                }
                
                
            }
                .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
            .padding(.horizontal)
        )
    }
}

#Preview {
    ContentView()
}
