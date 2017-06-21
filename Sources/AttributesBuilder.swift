import UIKit

public struct AttributesBuilder: AttributesContainer {
    
    public internal(set) var attributes: [NSAttributedStringKey : Any]
}

extension AttributesBuilder: _AttributesContainer {}
