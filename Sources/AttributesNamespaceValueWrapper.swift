import Foundation

public final class AttributesNamespaceValueWrapper<Value> {
    
    public let value: Value
    
    public required init(_ value: Value) {
        
        self.value = value
    }
}
