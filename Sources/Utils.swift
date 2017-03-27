import Foundation

extension NSRange {
    static func from(countableRange range: CountableRange<Int>) -> NSRange {
        return NSMakeRange(range.lowerBound, range.upperBound - range.lowerBound)
    }
}

public func +(lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
    let s = NSMutableAttributedString(attributedString: lhs)
    s.append(rhs)
    return s
}
