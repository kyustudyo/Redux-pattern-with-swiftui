//
//  rowView.swift
//  dds
//
//  Created by Hankyu Lee on 2022/06/13.
//

import SwiftUI

struct rowView: View {
    let forcast: ForecastReading
    var body: some View {
        VStack(spacing: 12) {
            Text(forcast.time)
                .font(.system(size: 12, weight: .bold))
            Image(systemName: "circle")
                .renderingMode(.original)
            Text(forcast.temp)
                .font(.system(size:16, weight: .medium))
        }
        .foregroundColor(.white)
    }
}

struct rowView_Previews: PreviewProvider {
    static var previews: some View {
        rowView(forcast: ForecastReading.dummy[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(.black)
    }
}

struct ForecastReading {
    let time: String
    let temp: String
}

extension ForecastReading {
    static let dummy = [
        ForecastReading(time: "13:24", temp: "25도"),
        ForecastReading(time: "11:24", temp: "0도"),
        ForecastReading(time: "13:1", temp: "23도"),
        ForecastReading(time: "13:2", temp: "21도"),
        ForecastReading(time: "13:34", temp: "22도"),
        ForecastReading(time: "13:67", temp: "28도")
    ]
}
