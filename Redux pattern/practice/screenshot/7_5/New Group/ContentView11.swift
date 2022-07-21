//
//  ContentView.swift
//  dds
//
//  Created by Hankyu Lee on 2022/06/13.
//

import SwiftUI

struct ContentView11: View {
    var body: some View {
        List {
            ForecastListView()
                .background(.blue)
        }
    }
}

struct ContentView11_Previews: PreviewProvider {
    static var previews: some View {
        ContentView11()
    }
}
