import Foundation

public protocol AttributesContainer {
    
    var attributes: [NSAttributedStringKey : Any] { get }
    
    init(_ attributes: [NSAttributedStringKey : Any])
}

extension AttributesContainer {
    
    public init(_ initialBlock: (inout Self) -> Void) {
        
        self.init([:])
        
        initialBlock(&self)
    }
    
    public func copy(_ modifyBlock: (inout Self) -> Void) -> Self {
        
        var builder = type(of: self).init(self.attributes)
        
        modifyBlock(&builder)
        
        return builder
    }
}
