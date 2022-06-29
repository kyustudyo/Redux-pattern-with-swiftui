
import SwiftUI

struct listView<Content, Data>: View
  where Content: View{

  let messageView: Content

  init(messageView: @escaping () -> Content) {

    self.messageView = messageView()
  }

  var body: some View {
    // 1
    List {
        ForEach(0..<3) { gem in

            Text("\(gem)")
      }

      messageView
    }
    .listStyle(.insetGrouped)
  }
}

extension listView where Content == EmptyView {
  init(_ gems: Data) {
      self.init {
          EmptyView()
      }
  }
}

struct GemList_Previews: PreviewProvider {

  static var previews: some View {
    
    NavigationView {
      listView  {
        
        Text("This is at the bottom")
          .padding()
          .listRowBackground(Color.clear)
          .frame(maxWidth: .infinity)
      }
    }
  }
}
