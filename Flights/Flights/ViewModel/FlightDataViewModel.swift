//
//  FlightData.swift
//  Flights
//
//  Created by Renata Albuquerque on 19/10/24.
//

import Foundation
import SwiftUI

class FlightDataViewModel: ObservableObject {
    @Published var flights: [Flight] = []
    @Published var searchText = ""

    func fetchData() {
        guard let url = URL(string: "https://mocki.io/v1/a4a3830c-37aa-4ce7-a131-b9912089b78a") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedFlights = try JSONDecoder().decode([Flight].self, from: data)
                    DispatchQueue.main.async {
                        self.flights = decodedFlights
                    }
                } catch {
                    print("Failed to decode JSON: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }

    var filteredFlights: [Flight] {
        if searchText.isEmpty {
            return flights
        } else {
            return flights.filter { $0.flightNumber.contains(searchText) }
        }
    }
    
    func formatDate(_ isoDate: String) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            dateFormatter.locale = Locale(identifier: "pt_BR")

            if let date = dateFormatter.date(from: isoDate) {
                let outputFormatter = DateFormatter()
                outputFormatter.dateFormat = "dd/MM HH:mm"
                return outputFormatter.string(from: date)
            } else {
                return "Data Inválida"
            }
        }
    
    func statusBackgroundColor(for status: String) -> Color {
            if status == "Atrasado" {
                return Color.red.opacity(0.2)
            } else {
                return Color.blue.opacity(0.2)
            }
    }

    func statusTextColor(for status: String) -> Color {
            if status == "Atrasado" {
                return Color.red
            } else {
                return Color.blue
            }
    }
}
