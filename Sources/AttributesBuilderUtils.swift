import Foundation

extension NSRange {
    
    var countableRange: CountableRange<Int> {
        return self.location..<(self.location + self.length)
    }
}

extension CountableRange where Bound == Int {
    
    var nsRange: NSRange {
        return NSMakeRange(self.lowerBound, self.upperBound - self.lowerBound)
    }
}

extension String {
    
    var fullCountableRange: CountableRange<Int> {
        return 0..<self.count
    }
    
    var fullNSRange: NSRange {
        return NSMakeRange(0, self.count)
    }
}

public func +(lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
    
    let s = NSMutableAttributedString(attributedString: lhs)
    s.append(rhs)
    return s
}
