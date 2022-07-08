import SwiftUI

struct Animation2: View {
    @State var showingSubview = false
    
    var body: some View {
        VStack(spacing: 0) {
            Button("Show Subview") {
                withAnimation(.easeInOut(duration: 2)) {
                    showingSubview.toggle()
                }
            }

            Text("Subview")
                .padding()
                .frame(height: showingSubview ? .infinity : 0, alignment: .top)
                .background(Color.green)
                .opacity(showingSubview ? 1 : 0)
            
        }
        .padding()
        .background(Color.yellow)
//        .offset(x: showingSubview ? 150 : 0, y: 0)
    }
}

struct Animation2_Previews: PreviewProvider {
    static var previews: some View {
        Animation2()
    }
}
