//
//  ContentView.swift
//  Flights
//
//  Created by Renata Albuquerque on 19/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = FlightDataViewModel()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                       Text("FlightMonitor")
                           .font(.title)
                           .bold()
                   }
                   .padding([.leading, .top])


                HStack {
                       TextField("Buscar por número do voo", text: $viewModel.searchText)
                           .padding(10)
                           .background(Color(.white))
                           .cornerRadius(10)
                       
                       Image(systemName: "magnifyingglass")
                           .foregroundColor(.blue)
                           .padding(.trailing, 15)
                   }
                   .padding(.all, 2)
                   .background(Color(.white))
                   .cornerRadius(10)
                   .shadow(radius: 4)
                   .padding(.horizontal, 10)
                   .padding(.bottom, 15)
                
                ScrollView {
                    VStack {
                        ForEach(viewModel.filteredFlights) { flight in
                            NavigationLink(destination: FlightDetail(flight: flight)) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.white)
                                        .shadow(radius: 4)
                                        .padding(.horizontal, 10)

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
                                            Spacer()
                                            VStack(alignment: .leading) {
                                                Text("Terminal")
                                                    .font(.headline)
                                                    .foregroundColor(.primary)
                                                    Text(flight.origin.terminal)
                                                    .font(.body)
                                            }
                                            Spacer()
                                            VStack(alignment: .leading) {
                                                Text("Portão")
                                                    .font(.headline)
                                                    .foregroundColor(.primary)
                                                    Text(flight.origin.gate)
                                                    .font(.body)
                                            }
                                        }.padding(.top, 10)
                                    }
                                    .padding()
                                }
                                .padding(.vertical, 5)
                            }
                        }
                    }
                }.padding(.bottom, 20)
                .onAppear {
                    viewModel.fetchData()
                }
            }
            .padding(.bottom)
            .background(Color(.systemGroupedBackground))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
