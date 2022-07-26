//
//  alignmentGuide.swift
//  Redux pattern
//
//  Created by Hankyu Lee on 2022/07/19.
//
//https://klioop.tistory.com/31
import SwiftUI
struct Day: View {
    let label: String
    var body: some View {
        Text(label)
    }
}
struct alignmentGuide: View {
    var body: some View {
//        ZStack {
//            Rectangle()
//                .frame(height:1)
//            Rectangle()
//                .frame(width:1)
        VStack {
            VStack(alignment: .center) {
                        Day(label: "월요일")
                            .alignmentGuide(HorizontalAlignment.center, computeValue: { dimension in
                                dimension[HorizontalAlignment.leading] + 11
                            })
//                            .alignmentGuide(HorizontalAlignment.leading) { dimension in
//                                50
//                            }//.center가아니므로 무시됨
                        Day(label: "화요일")
                    .alignmentGuide(HorizontalAlignment.center) { dimension in
                        dimension[HorizontalAlignment.trailing] + 0
                    }
                        Day(label: "수요일")
                    .alignmentGuide(HorizontalAlignment.center) { dimension in
                        dimension[HorizontalAlignment.leading] + 0
                    }
                        Day(label: "목요일")
                    .alignmentGuide(HorizontalAlignment.crossAlignment) { dimension in
                        dimension[HorizontalAlignment.trailing]
                    }
                        Day(label: "금요일")
                        Day(label: "토요일")
                        Day(label: "일요일")
            }
            .frame(width: 200)
            .padding(.vertical)
            .border(Color.gray)
            
            VStack(alignment: .crossAlignment) {
                Text("안녕안녕안녕안녕")
                    .alignmentGuide(HorizontalAlignment.crossAlignment, computeValue: {
                        dimension in
                        dimension[.leading]
                    })
                Text("하시오~!")
                    .alignmentGuide(HorizontalAlignment.crossAlignment) { dimension in
                        dimension[.trailing]
                    }
                Text("안녕안녕")
                Text("하시오~!")
            }
            
        }
    }
}

struct alignmentGuide_Previews: PreviewProvider {
    static var previews: some View {
        alignmentGuide()
    }
}

extension HorizontalAlignment {
    private enum CrossAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[HorizontalAlignment.center]
        }
    }

    static let crossAlignment = HorizontalAlignment(CrossAlignment.self)
}
