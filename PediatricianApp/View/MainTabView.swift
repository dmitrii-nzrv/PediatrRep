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
            ContentView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Главная")
                }
            AppointmentsView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Приёмы")
                }
            
            ChatView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Чат")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Профиль")
                }
        }
        .accentColor(.pink)
    }
}
