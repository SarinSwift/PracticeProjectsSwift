import UIKit

enum MathElement: CustomStringConvertible {
    case Integer(value: Int)                        // (value: Int(5)) -> 5
    case Percentage(value: Int)                     // (value: Int(82) -> 82%
    case Expression(expression: MathExpression)     // (expression: MathExpression(lhs: .Integer(value: 3), rhs: .Integer(value: 4), operator: .plus)) -> (3 + 4)
    
    var description: String {
        switch self {
        case .Integer(let value): return "\(value)"
        case .Percentage(let percentage): return "\(percentage)%"
        case .Expression(let expr): return expr.description
        }
    }
    
    var nsExpressionFormatString: String {
        switch self {
        case .Integer(let value): return "\(value).0"
        case .Percentage(let percentage): return "\(Double(percentage) / 100)"
        case .Expression(let expr): return "\(expr.description)"
        }
    }
}


enum MathOperator: String {
    case plus = "+"
    case minus = "-"
    case multiply = "*"
    case divide = "/"
    case root = "√"
    
    // random function to return a random operator
    static func random() -> MathOperator {
        let allMathOperators: [MathOperator] = [.plus, .minus, .multiply, .divide]
        let ind = Int(arc4random_uniform(UInt32(allMathOperators.count)))
        
        return allMathOperators[ind]
    }
    
    // random function to return a random plus or minus operator
    static func randomAddSub() -> MathOperator {
        let allMathOperators: [MathOperator] = [.plus, .minus]
        let ind = Int(arc4random_uniform(UInt32(allMathOperators.count)))
        
        return allMathOperators[ind]
    }
    
    // random function to return a random divide or mulitply operator
    static func randomDivMul() -> MathOperator {
        let allMathOperators: [MathOperator] = [.divide, .multiply]
        let ind = Int(arc4random_uniform(UInt32(allMathOperators.count)))
        
        return allMathOperators[ind]
    }
}



// Main class
class MathExpression: CustomStringConvertible {
    var lhs: MathElement
    var rhs: MathElement
    var `operator`: MathOperator
    
    init(lhs: MathElement, rhs: MathElement, operator: MathOperator) {
        self.rhs = rhs
        self.lhs = lhs
        self.operator = `operator`
    }
    
    var description: String {
        var leftString = ""
        var rightString = ""
        
        if case .Expression(_) = lhs {
            leftString = "(\(lhs))"
        } else {
            leftString = lhs.description
        }
        if case .Expression(_) = rhs {
            rightString = "(\(rhs))"
        } else {
            rightString = rhs.description
        }
        
        return "\(leftString) \(self.operator.rawValue) \(rightString)"
    }
    
    var result: Any? {
        let format = "\(lhs.nsExpressionFormatString) \(`operator`.rawValue) \(rhs.nsExpressionFormatString)"
        let expr = NSExpression(format: format)
        
        return expr.expressionValue(with: nil, context: nil)
    }
    
    
    
    // returns random plus, minus, divide, mulitply equations
    static func random() -> MathExpression {
        let lhs = MathElement.Integer(value: Int(arc4random_uniform(100)))
        let rhs = MathElement.Integer(value: Int(arc4random_uniform(100)))
        
        return MathExpression.init(lhs: lhs, rhs: rhs, operator: .random())
    }
    
    // returns random Adding equations
    static func randomAddition() -> MathExpression {
        let lhs = MathElement.Integer(value: Int(arc4random_uniform(100)))
        let rhs = MathElement.Integer(value: Int(arc4random_uniform(100)))
        
        return MathExpression.init(lhs: lhs, rhs: rhs, operator: .plus)
    }
    
    // returns random Subtracting equations
    static func randomSubtract() -> MathExpression {
        let lhs = MathElement.Integer(value: Int(arc4random_uniform(100)))
        let rhs = MathElement.Integer(value: Int(arc4random_uniform(100)))
        
        return MathExpression.init(lhs: lhs, rhs: rhs, operator: .minus)
    }
    
    // returns random Dividing equations
    static func randomDivide() -> MathExpression {
        let lhs = MathElement.Integer(value: Int(arc4random_uniform(100)))
        let rhs = MathElement.Integer(value: Int(arc4random_uniform(100)))
        
        return MathExpression.init(lhs: lhs, rhs: rhs, operator: .divide)
    }
    
    // returns random Multiplying equations
    static func randomMultiply() -> MathExpression {
        let lhs = MathElement.Integer(value: Int(arc4random_uniform(100)))
        let rhs = MathElement.Integer(value: Int(arc4random_uniform(100)))
        
        return MathExpression.init(lhs: lhs, rhs: rhs, operator: .multiply)
    }
    
    
    // returns random Adding/Subtracting equations
    static func randomAddSubtract() -> MathExpression {
        let lhs = MathElement.Integer(value: Int(arc4random_uniform(100)))
        let rhs = MathElement.Integer(value: Int(arc4random_uniform(100)))
        
        return MathExpression.init(lhs: lhs, rhs: rhs, operator: .randomAddSub())
    }
    
    // returns random Multiply/Division equations
    static func randomDivMultiply() -> MathExpression {
        let lhs = MathElement.Integer(value: Int(arc4random_uniform(100)))
        let rhs = MathElement.Integer(value: Int(arc4random_uniform(100)))
        
        return MathExpression.init(lhs: lhs, rhs: rhs, operator: .randomDivMul())
    }
}





let a = MathExpression(lhs: .Integer(value: 1), rhs: .Integer(value: 2), operator: .divide)
let b = MathExpression(lhs: .Integer(value: 10), rhs: .Percentage(value: 20), operator: .minus)
let c = MathExpression.randomAddition()

let d = MathExpression(lhs: .Integer(value: 1), rhs: .Integer(value: 2), operator: .plus)
let e = MathExpression(lhs: .Integer(value: 3), rhs: .Integer(value: 4), operator: .plus)
let f = MathExpression(lhs: .Expression(expression: d), rhs: .Expression(expression: e), operator: .multiply)


let x = MathExpression.randomAddition()
let y = MathExpression.randomAddition()
let z = MathExpression(lhs: .Expression(expression: x), rhs: .Expression(expression: y), operator: .plus)


//print(f)
//print(a)
print("\(d) result is \(d.result ?? "")")
print("\(e) result is \(e.result ?? "")")

