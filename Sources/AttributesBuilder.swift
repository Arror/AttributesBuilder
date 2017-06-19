import UIKit

public struct AttributesBuilder: AttributesContainer {
    
    public internal(set) var attributes: [NSAttributedStringKey : Any]
    
    init(_ attributes: [NSAttributedStringKey : Any] = [:]) {
        
        self.attributes = [:]
    }
}
