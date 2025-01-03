//
//  MainTabView.swift
//  PediatricianApp
//
//  Created by Dmitrii Nazarov on 03.01.2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            // Вкладка "Главная"
            ContentView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Главная")
                }
            
            // Вкладка "Приёмы"
            AppointmentsView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Приёмы")
                }
            
            // Вкладка "Чат"
            ChatView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Чат")
                }
            
            // Вкладка "Профиль"
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Профиль")
                }
        }
        .accentColor(.pink) // Цвет выделенной вкладки
    }
}
