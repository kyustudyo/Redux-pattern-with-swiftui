//
//  ContentView.swift
//  dds
//
//  Created by Hankyu Lee on 2022/06/13.
//

import SwiftUI

struct geometryReader_card: View {
    
    func getPercentage(geo:  GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        print("max: \(maxDistance)")
        print("midx: \(currentX)")
        print(Double(1 - (currentX / maxDistance)) * 40)
        return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geometry) * 40.0), axis: (x: 0.0, y: 1.0, z: 0.0))
                                
                        
                            
                    }
                    .frame(width:250, height: 250)
                    .padding()
                }
            }
        }
    }
}

struct geometryReader_card_Previews: PreviewProvider {
    static var previews: some View {
        geometryReader_card()
    }
}
