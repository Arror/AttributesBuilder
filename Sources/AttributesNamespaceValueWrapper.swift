import Foundation

public protocol AttributesNamespaceValueWrappable {
    
    associatedtype ValueType
    
    var value: ValueType { get }
    
    init(_ value: ValueType)
}

public final class AttributesNamespaceValueWrapper<Value>: AttributesNamespaceValueWrappable {
    
    public let value: Value
    
    public required init(_ value: Value) {
        
        self.value = value
    }
}
