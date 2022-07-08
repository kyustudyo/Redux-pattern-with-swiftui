//
//  ForecastListView.swift
//  dds
//
//  Created by Hankyu Lee on 2022/06/13.
//

import SwiftUI

struct ForecastListView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top, spacing: 16) {
                ForEach(ForecastReading.dummy, id: \.time) { forecast in
                    rowView(forcast: forecast)
                }
            }
        }
    }
}

struct ForecastListView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastListView()
//            .previewLayout(.sizeThatFits)
            .background(.black)
    }
}
