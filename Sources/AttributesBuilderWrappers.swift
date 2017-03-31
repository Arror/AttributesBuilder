import Foundation

public final class AttributesBuilderValueWrapper<Value> {
    
    public let value: Value
    
    public required init(_ value: Value) {
        self.value = value
    }
}

public protocol AttributesBuilderNamespaceWrappable {
    
    associatedtype Namespace
    
    var rs: Namespace { get }
}

extension AttributesBuilderNamespaceWrappable {
    
    public var rs: AttributesBuilderValueWrapper<Self> {
        return AttributesBuilderValueWrapper<Self>(self)
    }
}
