import Foundation

public struct AttributesParagraphStyleBuilder: AttributesParagraphStyleContainer {
    
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
        
        self.init(nsParagraphStyle: style)
    }
    
    init(nsParagraphStyle: NSParagraphStyle?) {
        
        let style = nsParagraphStyle ?? NSParagraphStyle.default
        
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
    
    var nsParagraphStyle: NSParagraphStyle {
        
        let style = NSMutableParagraphStyle()
        
        style.lineSpacing = self.lineSpacing
        style.paragraphSpacing = self.paragraphSpacing
        style.alignment = self.alignment
        style.firstLineHeadIndent = self.firstLineHeadIndent
        style.headIndent = self.headIndent
        style.tailIndent = self.tailIndent
        style.lineBreakMode = self.lineBreakMode
        style.minimumLineHeight = self.minimumLineHeight
        style.maximumLineHeight = self.maximumLineHeight
        style.baseWritingDirection = self.baseWritingDirection
        style.lineHeightMultiple = self.lineHeightMultiple
        style.paragraphSpacingBefore = self.paragraphSpacingBefore
        style.hyphenationFactor = self.hyphenationFactor
        
        return style
    }
    
    public func merge(to attributesBuilder: inout AttributesBuilder) {
        
        attributesBuilder.attributes[.paragraphStyle] = self.nsParagraphStyle
    }
    
    public static func chekout(from attributesBuilder: AttributesBuilder, modifyBlock: (inout AttributesParagraphStyleBuilder) -> Void) -> AttributesParagraphStyleBuilder {
        
        var builder = AttributesParagraphStyleBuilder(nsParagraphStyle: attributesBuilder.attributes[.paragraphStyle] as? NSParagraphStyle)
        
        modifyBlock(&builder)
        
        return builder
    }
}

extension AttributesParagraphStyleBuilder: AttributesParagraphStyleMutableContainer {}
