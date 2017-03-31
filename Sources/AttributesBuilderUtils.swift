import Foundation

extension NSRange {
    
    func toCountableRange() -> CountableRange<Int> {
        return self.location..<(self.location + self.length)
    }
    
    static func from(countableRange range: CountableRange<Int>) -> NSRange {
        return NSMakeRange(range.lowerBound, range.upperBound - range.lowerBound)
    }
}

extension String {
    
    var fullRange: CountableRange<Int> {
        return 0..<self.characters.count
    }
    
    var fullNSRange: NSRange {
        return NSMakeRange(0, self.characters.count)
    }
}

public func +(lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
    
    let s = NSMutableAttributedString(attributedString: lhs)
    s.append(rhs)
    return s
}
