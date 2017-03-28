import Foundation

public protocol AttributesNamespaceWrappable {
    
    associatedtype Namespace
    
    var rs: Namespace { get }
}

extension AttributesNamespaceWrappable {
    
    public var rs: AttributesNamespaceValueWrapper<Self> {
        
        return AttributesNamespaceValueWrapper<Self>(self)
    }
}
