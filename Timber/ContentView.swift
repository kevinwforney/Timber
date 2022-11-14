//
//  ContentView.swift
//  Timber
//
//  Created by User19 on 2022/11/13.
//

import SwiftUI

struct ContentView: View {
    @State private var isReserve = false
    @State private var isMenu = false
    @State private var isMap = false
    @State private var bgColor = Color.orange
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                Text("Timber Bistro")
                    .font(Font.custom("CaviarDreams", size: 50))
                    .foregroundColor(.white)
                Button {
                    isReserve.toggle()
                } label: {
                    Image("buttonReserve")
                }
                .fullScreenCover(isPresented: $isReserve, content: ReservationView.init)
                Button {
                    isMenu.toggle()
                } label: {
                    Image("buttonMenu")
                }
                .fullScreenCover(isPresented: $isMenu, content: MenuView.init)
                Button {
                    isMap.toggle()
                } label: {
                    Image("buttonMap")
                }
                .fullScreenCover(isPresented: $isMap, content: MapView.init)
                Spacer()
                ColorPicker("", selection: $bgColor, supportsOpacity: false)
            }
            .padding(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(bgColor)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}
