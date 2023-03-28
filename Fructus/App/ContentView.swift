//
//  ContentView.swift
//  Fructus
//
//  Created by Dzmitry Bladyka on 28.03.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingSettings = false
    
    var fruits: [Fruit] = fruitsData
    
    var body: some View {
        NavigationView {
            List(fruits.shuffled()) { item in
                
                NavigationLink(destination: FruitDetailView(fruit: item)) {
                    FruitRowView(fruit: item)
                        .padding(.vertical, 4)
                }
                
            }
            .navigationTitle("Fruits")
            .navigationBarItems(
                trailing:
                    Button(action: {
                        isShowingSettings = true
                    }) {
                        Image(systemName: "slider.horizontal.3")
                    }
                    .sheet(isPresented: $isShowingSettings) {
                        SettingsView()
                    }
                )
        }
        .navigationViewStyle(StackNavigationViewStyle()) // for iPad
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
