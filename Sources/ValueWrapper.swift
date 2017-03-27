import Foundation

public protocol ValueWrappable {
    
    associatedtype ValueType
    
    var value: ValueType { get }
    
    init(_ value: ValueType)
}

public final class ValueWrapper<Value>: ValueWrappable {
    
    public let value: Value
    
    public required init(_ value: Value) {
        
        self.value = value
    }
}
