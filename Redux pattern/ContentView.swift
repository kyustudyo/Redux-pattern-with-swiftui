

import SwiftUI

//First, go to Redux_patternApp for checking what environmentObject is used!

struct ContentView: View {
    
    @EnvironmentObject var store: Store
    
    //Rather than using store.count, it is better to use local property like below to prepare for multiple stores or reducers which manage multiple different states.
    struct Props {
        let counter: Int
        let onIncrement: () -> Void
        let onDecrement: () -> Void
        let onAdd: (Int) -> Void
    }
    
    private func map(state: State) -> Props {
        Props(counter: state.counter, onIncrement: {
            store.dispatch(action: IncrementAction())
        }, onDecrement: {
            store.dispatch(action: DecrementAction())
        }, onAdd: {
            store.dispatch(action: AddAction(value: $0))
        })
    }
    
    //I didn't know that variable assignment is possible in body.
    //And it is always a good idea to give the view only the things that it actually needs.
    var body: some View {
        
        let props = map(state: store.state)
        
        //Text("\(store.state.counter"))
        //Beacuse this string might become very very long without variable props assignment.
        return VStack {
            Text("\(props.counter)")
                .padding()
            Button("Increment") {
                props.onIncrement()
            }
            Button("Decrement") {
                props.onDecrement()
            }
            Button("Add") {
                props.onAdd(100)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let store = Store(reducer: reducer)
        return ContentView().environmentObject(store)
    }
}
