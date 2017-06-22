import Foundation

extension Range where Bound == String.Index {
    
    func toNSRange(in string: String) -> NSRange {
        
        return NSRange(string.utf16Offset(fromIndex: self.lowerBound)..<string.utf16Offset(fromIndex: self.upperBound))
    }
}

extension NSRange {
    
    func toRange(in string: String) -> Range<String.Index>? {
        
        guard
            let start = string.index(of: self.lowerBound),
            let end = string.index(of: self.upperBound) else {
                
                return nil
        }
        
        return start..<end
    }
}

extension String {
    
    var range: Range<String.Index> {
        
        return self.startIndex..<self.endIndex
    }
    
    var nsRange: NSRange {
        
        return (self.startIndex..<self.endIndex).toNSRange(in: self)
    }
    
    func index(of utf16ViewOffset: Int) -> String.Index? {
        
        return String.UTF16View.Index(utf16ViewOffset).samePosition(in: self)
    }
    
    func utf16Offset(fromIndex index: String.Index) -> Int {
        
        return self.utf16.startIndex.distance(to: index.samePosition(in: self.utf16))
    }
}

public func +(lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
    
    let s = NSMutableAttributedString(attributedString: lhs)
    s.append(rhs)
    return s
}

public func +(lhs: String, rhs: NSAttributedString) -> NSAttributedString {
    
    let s = NSMutableAttributedString(string: lhs)
    s.append(rhs)
    return s
}

public func +(lhs: NSAttributedString, rhs: String) -> NSAttributedString {
    
    let s = NSMutableAttributedString(attributedString: lhs)
    s.append(NSAttributedString(string: rhs))
    return s
}
