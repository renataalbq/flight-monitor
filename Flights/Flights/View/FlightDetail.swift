//
//  FlightDetail.swift
//  Flights
//
//  Created by Renata Albuquerque on 19/10/24.
//

import Foundation
import SwiftUI

struct FlightDetail: View {
    let flight: Flight
    @StateObject var viewModel = FlightDataViewModel()

    var body: some View {
        ScrollView {
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text(flight.flightNumber)
                            .font(.headline)
                            .foregroundColor(.gray)
                        Spacer()
                        Text(flight.status)
                            .font(.subheadline)
                            .bold()
                            .padding(8)
                            .background(viewModel.statusBackgroundColor(for: flight.status))
                            .foregroundColor(viewModel.statusTextColor(for: flight.status))
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 5)
                    
                    Divider()
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(flight.origin.city)
                                .font(.title3)
                                .bold()
                                .foregroundColor(.primary)
                            Text(flight.origin.airportCode)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(systemName: "airplane")
                            .font(.title2)
                            .foregroundColor(.blue)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text(flight.destination.city)
                                .font(.title3)
                                .bold()
                                .foregroundColor(.primary)
                            Text(flight.destination.airportCode)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 5)
                    
                    HStack(spacing: 30) {
                        VStack(alignment: .leading) {
                            Text("Partida")
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(viewModel.formatDate(flight.origin.departureTime ?? "N/A"))
                                 .font(.body)
                        }
                        VStack(alignment: .leading) {
                            Text("Terminal")
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(flight.origin.terminal)
                                .font(.body)
                        }
                        VStack(alignment: .leading) {
                            Text("Portão")
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(flight.origin.gate)
                                .font(.body)
                        }
                    }.padding(.top, 10)
                    
                    HStack(spacing: 30) {
                        VStack(alignment: .leading) {
                            Text("Chegada")
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(viewModel.formatDate(flight.destination.arrivalTime ?? "N/A"))
                                 .font(.body)
                        }
                        VStack(alignment: .leading) {
                            Text("Terminal")
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(flight.destination.terminal)
                                .font(.body)
                        }
                        VStack(alignment: .leading) {
                            Text("Portão")
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(flight.destination.gate)
                                .font(.body)
                        }
                    }.padding(.top, 10)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Aeronave")
                            .font(.headline)
                            .foregroundColor(.primary)
                        HStack {
                            Text("Modelo:")
                                .font(.body)
                            Text(flight.aircraft.model)
                                .font(.body)
                                .bold()
                        }
                        HStack {
                            Text("Capacidade de Assentos:")
                                .font(.body)
                            Text("\(flight.aircraft.seatingCapacity)")
                                .font(.body)
                                .bold()
                        }
                    }.padding(.top, 10)
                }
                .padding()
            }
            .padding(.vertical, 5)

    }
}
