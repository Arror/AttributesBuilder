import Foundation

protocol StringRangeConvertible {
    
    var range: Range<String.Index> { get }
    
    var nsRange: NSRange { get }
}

extension String: StringRangeConvertible {
    
    var range: Range<String.Index> {
        
        return self.startIndex..<self.endIndex
    }
    
    var nsRange: NSRange {
        
        return (self.startIndex..<self.endIndex).toNSRange(in: self)
    }
}

extension NSAttributedString: StringRangeConvertible {
    
    var range: Range<String.Index> {
        
        return self.string.range
    }
    
    var nsRange: NSRange {
        
        return self.string.nsRange
    }
}
