import UIKit

public protocol AttributesBuilder {
    
    func build() -> [NSAttributedStringKey: Any]
}

extension AttributesBuilder where Self: AttributesContainer {
    
    public func build() -> [NSAttributedStringKey: Any] {
        
        return self.attributes
    }
}
