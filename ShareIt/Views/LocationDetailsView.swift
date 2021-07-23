//
//  LocationDetailsView.swift
//  ShareIt
//
//  Created by Vachko on 14.07.21.
//

import SwiftUI

struct LocationDetailsView: View {
    
    @StateObject var viewModel = LocationViewModel()
    
    @State private var selectedCountry: String = countries.first!
    @State private var selectedCity: String = cities.first!
    @State private var selectedHouseNumber: Int = 0
    @State private var address: String = ""
    @State private var buttonActive = true
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Form {
                    Section(header: Text("Global")) {
                        ZStack {
                            HStack {
                                Image(systemName: "location.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.white)
                                
                                Text(selectedCountry)
                                    .padding(.leading, 10)
                                
                                Spacer()
                            }
                            
                            Picker(selection: $selectedCountry, label: Text("").frame(maxWidth: .infinity), content: {
                                ForEach(countries, id: \.self) { country in
                                    Text(country)
                                }
                            })
                            .pickerStyle(MenuPickerStyle())
                            .onChange(of: selectedCountry, perform: { value in
                                viewModel.country = selectedCountry
                                viewModel.check()
                            })
                        }
                        
                        HStack {
                            Image(systemName: "location.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                            
                            Picker(selection: $selectedCity, label: Text(selectedCity).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 10), content: {
                                ForEach(cities, id: \.self) { city in
                                    Text(city)
                                }
                            })
                            .onChange(of: selectedCity, perform: { value in
                                viewModel.city = selectedCity
                                viewModel.check()
                            })
                        }
                    }
                    
                    Section(header: Text("Local")) {
                        CustomTextField(text: $address, placeHolder: Text("Address"), imageName: "location.circle.fill")
                        ZStack {
                            HStack {
                                Image(systemName: "location.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.white)
                                
                                Text("House number")
                                    .padding(.leading, 10)
                                
                                Spacer()
                            }
                            
                            Picker(selection: $selectedHouseNumber, label: Text("").frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 10), content: {
                                ForEach(0 ..< 100) {
                                    Text("\($0)")
                                    
                                }
                            })
                            .pickerStyle(MenuPickerStyle())
                        }
                    }
                    
                    Section(header: Text("Add description")) {
                        
                    }
                    
                    Section(header: Text("Add photos")) {
                        
                    }
                    
                    
                    
                }
                
                
                SendButton(isOn: $viewModel.disabled, viewModel: viewModel)
                
                
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .navigationTitle("Add location")
        }
    }
}

struct SendButton: View {
    
    @Binding var isOn: Bool
    
    @ObservedObject var viewModel: LocationViewModel
    
    var body: some View {
        Button(action: {
            print("GGG")
            viewModel.send()
        }, label: {
            Text("Send")
                .font(.system(size: 30, weight: .semibold))
                .foregroundColor(isOn ? .black : .white)
                .frame(width: UIScreen.main.bounds.width, height: 70)
                .background(isOn ? Color(.gray) : Color(.green))
        })
        .disabled(isOn ? true : false)
        //        .foregroundColor(isOn ? .black : .white)
        //        .background(isOn ? Color(.gray) : Color(.green))
    }
}

struct LocationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailsView()
            .preferredColorScheme(.dark)
    }
}
