import UIKit

public final class AttributesBuilder: AttributesAdmissible {
    
    var attributes: [String: Any] = [:]
    
    public init() {}
}

extension String: AttributesNamespaceWrappable {}

extension NSAttributedString: AttributesNamespaceWrappable {}

extension AttributesNamespaceValueWrapper where Value == String {
    
    public func rendered(by builder: AttributesBuilder, range: CountableRange<Int>? = nil) -> NSAttributedString {
        
        let s = NSAttributedString(string: self.value)
        
        return s.rs.rendered(by: builder, range: range)
    }
}

extension AttributesNamespaceValueWrapper where Value: NSAttributedString {
    
    public func rendered(by builder: AttributesBuilder, range: CountableRange<Int>? = nil) -> NSAttributedString {
                
        let fullRange = 0..<self.value.string.characters.count
        
        let ranges: [CountableRange<Int>] = [range ?? fullRange]
        
        return self.rendered(by: builder, ranges: ranges)
    }
    
    func rendered(by builder: AttributesBuilder, ranges: [CountableRange<Int>] = []) -> NSAttributedString {
        
        let s = NSMutableAttributedString(attributedString: self.value)
        
        let fullRange = 0..<self.value.string.characters.count
        
        ranges.forEach { range in
            s.addAttributes(builder.attributes, range: NSRange.from(countableRange: fullRange.clamped(to: range)))
        }
        
        return s
    }
}
