import Foundation

protocol AttributesParagraphStyleMutableContainer: AttributesParagraphStyleContainer {
    
    var lineSpacing: CGFloat { get set }
    
    var paragraphSpacing: CGFloat { get set }
    
    var alignment: NSTextAlignment { get set }
    
    var firstLineHeadIndent: CGFloat { get set }
    
    var headIndent: CGFloat { get set }
    
    var tailIndent: CGFloat { get set }
    
    var lineBreakMode: NSLineBreakMode { get set }
    
    var minimumLineHeight: CGFloat { get set }
    
    var maximumLineHeight: CGFloat { get set }
    
    var baseWritingDirection: NSWritingDirection { get set }
    
    var lineHeightMultiple: CGFloat { get set }
    
    var paragraphSpacingBefore: CGFloat { get set }
    
    var hyphenationFactor: Float { get set }
    
    init()
    
    init(nsParagraphStyle: NSParagraphStyle?)
}

extension AttributesParagraphStyleMutableContainer {
    
    public init(_ initialBlock: (inout Self) -> Void) {
        
        self.init()
        
        initialBlock(&self)
    }
    
    public func copy(_ copyBlock: (inout Self) -> Void) -> Self {
        
        var copied = self
        
        copyBlock(&copied)
        
        return copied
    }
}

extension AttributesParagraphStyleMutableContainer {
    
    mutating public func lineSpacing(_ spacing: @autoclosure () -> CGFloat) {
        self.lineSpacing = spacing()
    }
    
    mutating public func paragraphSpacing(_ spacing: @autoclosure () -> CGFloat) {
        self.paragraphSpacing = spacing()
    }
    
    mutating public func alignment(_ alignment: @autoclosure () -> NSTextAlignment) {
        self.alignment = alignment()
    }
    
    mutating public func firstLineHeadIndent(_ indent: @autoclosure () -> CGFloat) {
        self.firstLineHeadIndent = indent()
    }
    
    mutating public func headIndent(_ indent: @autoclosure () -> CGFloat) {
        self.headIndent = indent()
    }
    
    mutating public func tailIndent(_ indent: @autoclosure () -> CGFloat) {
        self.tailIndent = indent()
    }
    
    mutating public func lineBreakMode(_ mode: @autoclosure () -> NSLineBreakMode) {
        self.lineBreakMode = mode()
    }
    
    mutating public func minimumLineHeight(_ height: @autoclosure () -> CGFloat) {
        self.minimumLineHeight = height()
    }
    
    mutating public func maximumLineHeight(_ height: @autoclosure () -> CGFloat) {
        self.maximumLineHeight = height()
    }
    
    mutating public func baseWritingDirection(_ direction: @autoclosure () -> NSWritingDirection) {
        self.baseWritingDirection = direction()
    }
    
    mutating public func lineHeightMultiple(_ height: @autoclosure () -> CGFloat) {
        self.lineHeightMultiple = height()
    }
    
    mutating public func paragraphSpacingBefore(_ spacing: @autoclosure () -> CGFloat) {
        self.paragraphSpacingBefore = spacing()
    }
    
    mutating public func hyphenationFactor(_ factor: @autoclosure () -> Float) {
        self.hyphenationFactor = factor()
    }
}
