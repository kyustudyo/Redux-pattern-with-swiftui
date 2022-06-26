
import UIKit

struct Pizza {
    let dough: String
    let toppings: [String]
}

enum PizzaBuilderError: Error {
    case doughBurnt
    case noToppings(String)
}

struct PizzaBuilder {
    
    func prepare() -> Pizza? {
        
        do {
            let dough = try prepareDough(요구사항: 50)
            let toppings = try prepareToppings(요구사항: 20000)
            // return pizza
            return Pizza(dough: dough, toppings: toppings)
        } catch {
            print(error)
            print("Unable to prepare pizza")
            return nil
        }
    }
    
    private func prepareDough(요구사항: Int) throws -> String {
        // prepare the dough
        if 요구사항 > 100 {
            throw PizzaBuilderError.doughBurnt
        }
        return "성공"
    }
    
    private func prepareToppings(요구사항: Int) throws -> [String] {
          
          // prepare the toppings
        if 요구사항 > 100 {
            throw PizzaBuilderError.noToppings("Chicken and onions are missing!")
        } else {
            return ["성공"]
        }
        
      }
}

let a = PizzaBuilder()
a.prepare()

