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
    
    var body: some View {
        NavigationView {
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
                TrackingView()
                    .environmentObject(locationViewModel)
            default:
                Text("Unexpected status")
            }
        }
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
    
    
    var body: some View {
        VStack {
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
                    leftText: "Altitude",
                    rightText: String(locationViewModel.lastSeenLocation?.altitude ?? 0)
                )
                PairView(
                    leftText: "Speed",
                    rightText: String(locationViewModel.lastSeenLocation?.speed ?? 0)
                )
                PairView(
                    leftText: "Country",
                    rightText: locationViewModel.currentPlacemark?.country ?? ""
                )
                PairView(leftText: "City", rightText: locationViewModel.currentPlacemark?.administrativeArea ?? ""
                )
                PairView(
                    leftText: "Kvartal",
                    rightText: locationViewModel.currentPlacemark?.subLocality ?? ""
                )
                PairView(
                    leftText: "Street",
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
