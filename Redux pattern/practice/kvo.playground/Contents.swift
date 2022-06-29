import Foundation


var greeting = "Hello, playground"

struct Student {
    var name : String
}

struct SoccerClass {
    let student1: Student
    let student2: Student
}

let student5 = Student(name: "lee")
let student2 = Student(name: "kim")
let soccerClass = SoccerClass(student1: student5, student2: student2)
func getStudent1(soccerClass: SoccerClass) -> Student {
    return soccerClass.student1
}
func getStudent2(soccerClass: SoccerClass) -> Student {
    return soccerClass.student2
}

func getStudent(soccerClass: SoccerClass, keypath: KeyPath<SoccerClass, Student>)->Student {
    return soccerClass[keyPath: keypath]
}
print(getStudent(soccerClass: soccerClass, keypath: \.student1).name)

struct SoccerClassStruct {
    var socClass : SoccerClass
    var path: KeyPath<SoccerClass, Student>
    var name : String {
        switch path {
        case \.student1:
            return "s1"
        case \.student2:
            return "s2"
        default : return ""
        }
    }
}

let scs1 = SoccerClassStruct(socClass: soccerClass, path: \.student1)
let scs2 = SoccerClassStruct(socClass: soccerClass, path: \.student2)


//
//
//import SwiftUI
//
//struct HikeDetail: View {
//    let hike: Hike
//    @State var dataToShow = \Hike.Observation.elevation
//
//    var buttons = [
//        ("Elevation", \Hike.Observation.elevation),
//        ("Heart Rate", \Hike.Observation.heartRate),
//        ("Pace", \Hike.Observation.pace)
//    ]
//
//    var body: some View {
//        VStack {
//            HikeGraph(hike: hike, path: dataToShow)
//                .frame(height: 200)
//
//            HStack(spacing: 25) {
//                ForEach(buttons, id: \.0) { value in
//                    Button {
//                        dataToShow = value.1
//                    } label: {
//                        Text(value.0)
//                            .font(.system(size: 15))
//                            .foregroundColor(value.1 == dataToShow
//                                ? .gray
//                                : .accentColor)
//                            .animation(nil)
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct HikeDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        HikeDetail(hike: ModelData().hikes[0])
//    }
//}
