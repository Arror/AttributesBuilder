import UIKit

public final class AttributesBuilder: AttributesAdmissible {
    
    var attributes: [String: Any] = [:]
    
    public init() {}
}

extension String: AttributesNamespaceWrappable {}

extension NSAttributedString: AttributesNamespaceWrappable {}

extension ValueWrappable where ValueType == String {
    
    public func rendered(by builder: AttributesBuilder, range: CountableRange<Int>? = nil) -> NSAttributedString {
        
        let s = NSAttributedString(string: self.value)
        
        return s.rs.rendered(by: builder, range: range)
    }
}

extension ValueWrappable where ValueType: NSAttributedString {
    
    public func rendered(by builder: AttributesBuilder, range: CountableRange<Int>? = nil) -> NSAttributedString {
        
        let s = NSMutableAttributedString(attributedString: self.value)
        
        let r: CountableRange<Int> = {
            let full = 0..<self.value.string.characters.count
            if let range = range {
                return full.clamped(to: range)
            } else {
                return full
            }
        }()
        
        s.addAttributes(builder.attributes, range: NSRange.from(countableRange: r))
        
        return s
    }
}
