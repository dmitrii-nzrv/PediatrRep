//
//  JSONLoader.swift
//  PediatricianApp
//
//  Created by Dmitrii Nazarov on 29.12.2024.
//

import Foundation

func loadDoctorsFromJSON() -> [Doctor]? {
    guard let url = Bundle.main.url(forResource: "docInfo", withExtension: "json") else {
        print("Failed to locate docInfo.json in bundle.")
        return nil
    }
    
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        
        // Декодируем верхний уровень JSON
        let response = try decoder.decode(DoctorResponse.self, from: data)
        
        // Возвращаем массив врачей
        return response.record.data.users
    } catch {
        print("Failed to load or decode JSON: \(error.localizedDescription)")
        return nil
    }
}
