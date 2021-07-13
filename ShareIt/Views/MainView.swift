//
//  MainView.swift
//  ShareIt
//
//  Created by Vachko on 6.07.21.
//

import SwiftUI
import CoreLocation

struct MainView: View {
    @StateObject var locationViewModel = MainViewModel()
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var showMenu = false
    
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        showMenu = false
                    }
                }
            }
        
        return NavigationView {
            switch locationViewModel.authorizationStatus {
            case .notDetermined:
                AnyView(RequestLocationView())
            //                    .onAppear {
            //                        locationViewModel.requestPermission()
            //                    }
            case .restricted:
                ErrorView(errorText: "Location use is restricted.")
            case .denied:
                ErrorView(errorText: "The app does not have location permissions. Please enable them in settings.")
            case .authorizedAlways, .authorizedWhenInUse:
                ZStack(alignment: .leading) {
                    TrackingView(showMenu: $showMenu)
                        .environmentObject(locationViewModel)
                        .offset(x: showMenu ? UIScreen.main.bounds.width / 2 : 0)
                        .disabled(showMenu ? true : false)
                    if showMenu {
                        SideBarView()
                            .frame(width: UIScreen.main.bounds.width / 2)
                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(drag)
                .navigationBarTitle("Main view", displayMode: .inline)
//                .navigationBarItems(leading: (
//                    Button(action: {
//                        withAnimation {
//                            showMenu.toggle()
//                        }
//                    }) {
//                        Image(systemName: "line.horizontal.3")
//                            .imageScale(.large)
//                    }
//                ))
//                .navigationBarItems(trailing: (
//                    Button {
//                        viewModel.signOut()
//                    } label: {
//                        Text("Logout")
//                    }
//                ))
                .navigationBarItems(leading: (
                    Button(action: {
                        withAnimation {
                            showMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                    }
                ), trailing: (
                    Button {
                        viewModel.signOut()
                    } label: {
                        Text("Logout")
                    }
                ))
            default:
                Text("Unexpected status")
                
            }
        }
        //        .navigationBarTitle("Main view", displayMode: .inline)
        //        .navigationBarItems(leading: (
        //            Button(action: {
        //                withAnimation: do {
        //                    showMenu.toggle()
        //                }
        //            }) {
        //                Image(systemName: "line.horizontal.3")
        //                    .imageScale(.large)
        //            }
        //        ))
    }
    
}


struct RequestLocationView: View {
    //    @EnvironmentObject var locationViewModel: MainViewModel
    
    var body: some View {
        Text("Hello word!")
        //        VStack {
        //            Image(systemName: "location.circle")
        //                .resizable()
        //                .frame(width: 100, height: 100, alignment: .center)
        //                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        //            Button(action: {
        ////                locationViewModel.requestPermission()
        //            }, label: {
        //                Label("Allow tracking", systemImage: "location")
        //            })
        //            .padding(10)
        //            .foregroundColor(.white)
        //            .background(Color.blue)
        //            .clipShape(RoundedRectangle(cornerRadius: 8))
        //            Text("We need your permission to track you.")
        //                .foregroundColor(.gray)
        //                .font(.caption)
        //        }
        //        .onAppear {
        //            locationViewModel.requestPermission()
        //        }
    }
}

struct ErrorView: View {
    var errorText: String
    
    var body: some View {
        VStack {
            Image(systemName: "xmark.octagon")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            Text(errorText)
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.red)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct TrackingView: View {
    @EnvironmentObject var locationViewModel: MainViewModel
    @EnvironmentObject var viewModel: AuthViewModel
    
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack {
//            Button {
//                viewModel.signOut()
//            } label: {
//                Text("Logout")
//            }
            
            //            Text("Logged as \((viewModel.userSession?.email)!)")
            
            VStack {
                PairView(
                    leftText: "Latitude:",
                    rightText: String(coordinate?.latitude ?? 0)
                )
                PairView(
                    leftText: "Longitude:",
                    rightText: String(coordinate?.longitude ?? 0)
                )
                PairView(
                    leftText: "Altitude:",
                    rightText: String(locationViewModel.lastSeenLocation?.altitude ?? 0)
                )
                PairView(
                    leftText: "Speed:",
                    rightText: String(locationViewModel.lastSeenLocation?.speed ?? 0)
                )
                PairView(
                    leftText: "Country:",
                    rightText: locationViewModel.currentPlacemark?.country ?? ""
                )
                PairView(leftText: "City:", rightText: locationViewModel.currentPlacemark?.administrativeArea ?? ""
                )
                PairView(
                    leftText: "Neighborhood:",
                    rightText: locationViewModel.currentPlacemark?.subLocality ?? ""
                )
                PairView(
                    leftText: "Street:",
                    rightText: locationViewModel.currentPlacemark?.thoroughfare ?? ""
                )
            }
            .padding()
        }
    }
    
    var coordinate: CLLocationCoordinate2D? {
        locationViewModel.lastSeenLocation?.coordinate
    }
}

struct PairView: View {
    let leftText: String
    let rightText: String
    
    var body: some View {
        HStack {
            Text(leftText)
            Spacer()
            Text(rightText)
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
