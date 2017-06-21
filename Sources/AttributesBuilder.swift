import UIKit

public struct AttributesBuilder: AttributesContainer {
    
    public internal(set) var attributes: [NSAttributedStringKey : Any]
}

extension AttributesBuilder: _AttributesContainer {
    
    internal init() {
        
        self.init([:])
    }
    
    internal init(_ attributes: [NSAttributedStringKey : Any]) {
        
        self.attributes = attributes
    }
}
