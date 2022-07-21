//
//  ListingView.swift
//  dds
//
//  Created by Hankyu Lee on 2022/06/13.
//

import SwiftUI


import SwiftUI


struct ListingView_shortHand: View {
    let array: [String] = ["a", "b"]
  var body: some View {
      
    List {
        ForEach(array, id: \.self, content: ListingRow.init)
    }
  }
}

struct ListingRow: View {
    let name: String

    var body: some View {
        Text(name)
    }
}

struct ListingView_shortHand_Previews: PreviewProvider {
    static var previews: some View {
        ListingView_shortHand()
    }
}

