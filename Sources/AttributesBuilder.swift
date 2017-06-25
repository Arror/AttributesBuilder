import UIKit

public struct AttributesBuilder: AttributesContainer {
    
    var attributes: [NSAttributedStringKey : Any]
}

extension AttributesBuilder: AttributesMutableContainer {}
