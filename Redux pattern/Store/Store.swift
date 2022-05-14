
//Store, Action, ... can be in seperate files.

import Foundation

//global state
//struct State {
//    var counter: Int = 0
//    var movies = [String]()
//}
//typealias Reducer = (_ state: State, _ action: Action) -> State
typealias Dispatcher = (Action) -> Void
typealias Reducer<State:ReduxState> = (_ state: State, _ action: Action) -> State
typealias Middleware<StoreState: ReduxState> = (StoreState, Action, @escaping Dispatcher) -> Void


struct TaskState: ReduxState {
    var tasks: [Task] = [Task]()
}

protocol ReduxState { }

struct AppState : ReduxState {
    var counterState = CounterState()
    var taskState = TaskState()
}
struct CounterState : ReduxState {
    var counter = 0
}


protocol Action { }

struct IncrementAction: Action { }
struct DecrementAction: Action { }
struct IncrementActionAsync: Action { }

struct AddTaskAction: Action {
    let task : Task
}

//I create a struct 'getMoviewsAction' like below(as follows).
//It works perfectly fine but,
//If there are many Action like get,delete,edit movies and so on..
//The below reducer function gets much bigger.
//Eventually, one reducer has many too many responsibilites.
//So, we need to have multiple reducers.
//Like CounterReducer whoes job is to update the counter state.
//A movie's reducer is also created in the same way as a counter's reducer.
struct getMoviesAction: Action{
    let movies: [String]
}


struct AddAction: Action {
    
    let value: Int
    
    
}

//the job of the reducer is to update the state.
//func reducer(_ state: State, _ action: Action) -> State {
//
//    var state = state
//
//    switch action {
//        case _ as IncrementAction:
//            state.counter += 1
//        case _ as DecrementAction:
//            state.counter -= 1
//        case let action as AddAction:
//            state.counter += action.value
//        case let action as getMoviesAction:
//            state.movies = action.movies
//        default:
//            break
//    }
//
//    return state
//}

//A store without a reducer, it's not going to work.
class Store<StoreState:ReduxState>: ObservableObject {
    var middlewares: [Middleware<StoreState>]
    var reducer: Reducer<StoreState>
    @Published var state: StoreState
    
    // It is possible to write "(_ state: State, _ action: Action) -> State" in the reducer part, but it will be much better idea that if we create some sort of a typealias.
    init(reducer: @escaping Reducer<StoreState>, state: StoreState,middlewares: [Middleware<StoreState>] = []) {
        self.reducer = reducer
        self.state = state
        self.middlewares = middlewares
    }
    
    func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }
        
        // run all middlewares
        middlewares.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}

