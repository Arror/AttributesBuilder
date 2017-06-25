import UIKit

public struct AttributesBuilder: AttributesContainer {
    
    var attributes: [NSAttributedStringKey : Any]
}

extension AttributesBuilder: AttributesMutableContainer {}

public struct ParagraphStyleBuilder: AttributesParagraphStyleContainer {
    
    var lineSpacing: CGFloat
    var paragraphSpacing: CGFloat
    var alignment: NSTextAlignment
    var firstLineHeadIndent: CGFloat
    var headIndent: CGFloat
    var tailIndent: CGFloat
    var lineBreakMode: NSLineBreakMode
    var minimumLineHeight: CGFloat
    var maximumLineHeight: CGFloat
    var baseWritingDirection: NSWritingDirection
    var lineHeightMultiple: CGFloat
    var paragraphSpacingBefore: CGFloat
    var hyphenationFactor: Float
    
    init() {
        
        let style = NSParagraphStyle.default
        
        self.lineSpacing = style.lineSpacing
        self.paragraphSpacing = style.paragraphSpacing
        self.alignment = style.alignment
        self.firstLineHeadIndent = style.firstLineHeadIndent
        self.headIndent = style.headIndent
        self.tailIndent = style.tailIndent
        self.lineBreakMode = style.lineBreakMode
        self.minimumLineHeight = style.minimumLineHeight
        self.maximumLineHeight = style.maximumLineHeight
        self.baseWritingDirection = style.baseWritingDirection
        self.lineHeightMultiple = style.lineHeightMultiple
        self.paragraphSpacingBefore = style.paragraphSpacingBefore
        self.hyphenationFactor = style.hyphenationFactor
    }
}

extension ParagraphStyleBuilder: AttributesParagraphStyleMutableContainer {}
