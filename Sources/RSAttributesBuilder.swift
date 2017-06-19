import UIKit

public struct RSAttributesBuilder: AttributesContainer, AttributesBuilder {
    
    public private(set) var attributes: [NSAttributedStringKey : Any]
    
    public init(_ attributes: [NSAttributedStringKey : Any] = [:]) {
        
        self.attributes = [:]
    }
}

extension NSAttributedString {
    
    public enum LigatureStyle: Int {
        case none       = 0
        case `default`  = 1
    }
    
    public enum VerticalGlyphFormStyle: Int {
        case horizontal = 0
        case vertical   = 1
    }
}


extension RSAttributesBuilder {
    
    // NSFontAttributeName
    public mutating func font(_ font: UIFont) {
        self.attributes[.font] = font
    }
    
    // NSForegroundColorAttributeName
    public mutating func color(_ color: UIColor) {
        self.attributes[.foregroundColor] = color
    }
    
    // NSBackgroundColorAttributeName
    public mutating func backgroundColor(_ color: UIColor) {
        self.attributes[.backgroundColor] = color
    }
    
    // NSLigatureAttributeName
    public mutating func ligature(_ style: NSAttributedString.LigatureStyle) {
        self.attributes[.ligature] = style.rawValue
    }
    
    // NSKernAttributeName
    public mutating func characterSpacing(_ spacing: CGFloat) {
        self.attributes[.kern] = spacing
    }
    
    // NSStrikethroughStyleAttributeName
    public mutating func strikethroughStyle(_ style: NSUnderlineStyle) {
        self.attributes[.strikethroughStyle] = style
    }
    
    // NSStrikethroughColorAttributeName
    public mutating func strikethroughColor(_ color: UIColor) {
        self.attributes[.strikethroughColor] = color
    }
    
    // NSUnderlineStyleAttributeName
    public mutating func underlineStyle(_ style: NSUnderlineStyle) {
        self.attributes[.underlineStyle] = style
    }
    
    // NSUnderlineColorAttributeName
    public mutating func underlineColor(_ color: UIColor) {
        self.attributes[.underlineColor] = color
    }
    
    // NSStrokeWidthAttributeName
    public mutating func strokeWidth(_ width: CGFloat) {
        self.attributes[.strokeWidth] = width
    }
    
    // NSStrokeColorAttributeName
    public mutating func strokeColor(_ color: UIColor) {
        self.attributes[.strokeColor] = color
    }
    
    // NSShadowAttributeName
    public mutating func shadow(_ value: NSShadow) {
        self.attributes[.shadow] = value
    }
    
    // NSTextEffectAttributeName
    public mutating func textEffect(_ effect: NSAttributedString.TextEffectStyle) {
        self.attributes[.textEffect] = effect
    }
    
    // NSAttachmentAttributeName
    public mutating func attachment(_ value: NSTextAttachment) {
        self.attributes[.attachment] = value
    }
    
    // NSLinkAttributeName
    public mutating func link(_ url: URL) {
        self.attributes[.link] = url
    }
    
    // NSBaselineOffsetAttributeName
    public mutating func baselineOffset(_ offset: CGFloat) {
        self.attributes[.baselineOffset] = offset
    }
    
    // NSObliquenessAttributeName
    public mutating func obliqueness(_ value: CGFloat) {
        self.attributes[.obliqueness] = value
    }
    
    // NSExpansionAttributeName
    public mutating func expansion(_ value: CGFloat) {
        self.attributes[.expansion] = value
    }
    
    // NSVerticalGlyphFormAttributeName
    public mutating func verticalGlyphForm(_ style: NSAttributedString.VerticalGlyphFormStyle) {
        self.attributes[.verticalGlyphForm] = style.rawValue
    }
}

//extension AttributesBuilder {
//
//    var paragraphStyle: NSMutableParagraphStyle {
//        return self[.paragraphStyle] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
//    }
//
//    // NSParagraphStyleAttributeName - alignment
//    public func alignment(_ mode: NSTextAlignment) -> Self {
//        let style = self.paragraphStyle
//        style.alignment = mode
//        self[.paragraphStyle] = style
//        return self
//    }
//
//    // NSParagraphStyleAttributeName - firstLineHeadIndent
//    public func firstLineHeadIndent(_ indent: CGFloat) -> Self {
//        let style = self.paragraphStyle
//        style.firstLineHeadIndent = indent
//        self[.paragraphStyle] = style
//        return self
//    }
//
//    // NSParagraphStyleAttributeName - headIndent
//    public func headIndent(_ indent: CGFloat) -> Self {
//        let style = self.paragraphStyle
//        style.headIndent = indent
//        self[.paragraphStyle] = style
//        return self
//    }
//
//    // NSParagraphStyleAttributeName - tailIndent
//    public func tailIndent(_ indent: CGFloat) -> Self {
//        let style = self.paragraphStyle
//        style.tailIndent = indent
//        self[.paragraphStyle] = style
//        return self
//    }
//
//    // NSParagraphStyleAttributeName - lineBreakMode
//    public func lineBreakMode(_ mode: NSLineBreakMode) -> Self {
//        let style = self.paragraphStyle
//        style.lineBreakMode = mode
//        self[.paragraphStyle] = style
//        return self
//    }
//
//    // NSParagraphStyleAttributeName - minimumLineHeight
//    public func minimumLineHeight(_ height: CGFloat) -> Self {
//        let style = self.paragraphStyle
//        style.minimumLineHeight = height
//        self[.paragraphStyle] = style
//        return self
//    }
//
//    // NSParagraphStyleAttributeName - maximumLineHeight
//    public func maximumLineHeight(_ height: CGFloat) -> Self {
//        let style = self.paragraphStyle
//        style.maximumLineHeight = height
//        self[.paragraphStyle] = style
//        return self
//    }
//
//    // NSParagraphStyleAttributeName - lineSpacing
//    public func lineSpacing(_ spacing: CGFloat) -> Self {
//        let style = self.paragraphStyle
//        style.lineSpacing = spacing
//        self[.paragraphStyle] = style
//        return self
//    }
//
//    // NSParagraphStyleAttributeName - paragraphSpacing
//    public func paragraphSpacing(_ spacing: CGFloat) -> Self {
//        let style = self.paragraphStyle
//        style.paragraphSpacing = spacing
//        self[.paragraphStyle] = style
//        return self
//    }
//
//    // NSParagraphStyleAttributeName - paragraphSpacingBefore
//    public func paragraphSpacingBefore(_ spacingBefore: CGFloat) -> Self {
//        let style = self.paragraphStyle
//        style.paragraphSpacingBefore = spacingBefore
//        self[.paragraphStyle] = style
//        return self
//    }
//
//    // NSParagraphStyleAttributeName - baseWritingDirection
//    public func baseWritingDirection(_ direction: NSWritingDirection) -> Self {
//        let style = self.paragraphStyle
//        style.baseWritingDirection = direction
//        self[.paragraphStyle] = style
//        return self
//    }
//
//    // NSParagraphStyleAttributeName - lineHeightMultiple
//    public func lineHeightMultiple(_ height: CGFloat) -> Self {
//        let style = self.paragraphStyle
//        style.lineHeightMultiple = height
//        self[.paragraphStyle] = style
//        return self
//    }
//}
