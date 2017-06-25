import Foundation

public protocol AttributesParagraphStyleContainer {
    
    mutating func lineSpacing(_ spacing: @autoclosure () -> CGFloat)
    
    mutating func paragraphSpacing(_ spacing: @autoclosure () -> CGFloat)
    
    mutating func alignment(_ alignment: @autoclosure () -> NSTextAlignment)
    
    mutating func firstLineHeadIndent(_ indent: @autoclosure () -> CGFloat)
    
    mutating func headIndent(_ indent: @autoclosure () -> CGFloat)
    
    mutating func tailIndent(_ indent: @autoclosure () -> CGFloat)
    
    mutating func lineBreakMode(_ mode: @autoclosure () -> NSLineBreakMode)
    
    mutating func minimumLineHeight(_ height: @autoclosure () -> CGFloat)
    
    mutating func maximumLineHeight(_ height: @autoclosure () -> CGFloat)
    
    mutating func baseWritingDirection(_ direction: @autoclosure () -> NSWritingDirection)
    
    mutating func lineHeightMultiple(_ height: @autoclosure () -> CGFloat)
    
    mutating func paragraphSpacingBefore(_ spacing: @autoclosure () -> CGFloat)
    
    mutating func hyphenationFactor(_ factor: @autoclosure () -> Float)
}
