import Foundation

public protocol AttributesNamespaceWrappable {
    
    associatedtype Namespace
    
    var rs: Namespace { get }
}

extension AttributesNamespaceWrappable {
    
    public var rs: ValueWrapper<Self> { return ValueWrapper<Self>(self) }
}
