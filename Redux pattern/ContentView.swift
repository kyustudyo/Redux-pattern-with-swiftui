

import SwiftUI

struct ContentView13: View {
    
    @State private var isPresented:Bool = false
    @EnvironmentObject var store: Store<AppState>
    
    //Rather than using store.count, it is better to use local property like below to prepare for multiple stores or reducers which manage multiple different states.
    
    struct Props {
        let counter: Int
        let onIncrement: () -> Void
        let onDecrement: () -> Void
        let onAdd: (Int) -> Void
        let onIncrementAsync: () -> Void
    }
    
    private func map(state: CounterState) -> Props {
        Props(counter: state.counter, onIncrement: {
            store.dispatch(action: IncrementAction())
        }, onDecrement: {
            store.dispatch(action: DecrementAction())
        }, onAdd: {
            store.dispatch(action: AddAction(value: $0))
        }, onIncrementAsync: {
            store.dispatch(action: IncrementActionAsync())
        })
    }
    
    //I didn't know that variable assignment is possible in body.
    //And it is always a good idea to give the view only the things that it actually needs.
    var body: some View {
        
        let props = map(state: store.state.counterState)
        
        //Text("\(store.state.counter"))
        //Beacuse this string might become very very long without variable props assignment.
        return VStack {
            Spacer()
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
            Button("Increment Async") {
                props.onIncrementAsync()
            }
            Spacer()
            Button("add task") {
                isPresented = true
            }
            Spacer()
        }.sheet(isPresented: $isPresented) {
//            Text("Add task view")
            AddTaskView()
        }
        
    }
}

struct ContentView13_Previews: PreviewProvider {
    static var previews: some View {
        
        let store = Store(reducer: appReducer, state: AppState())
        return ContentView13().environmentObject(store)
    }
}
