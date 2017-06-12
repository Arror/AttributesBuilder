import UIKit

public final class AttributesBuilder {
    
    var attributes: [NSAttributedStringKey: Any] = [:]
    
    public init() {}
}

extension AttributesBuilder {
    
    convenience init(attributes: [NSAttributedStringKey: Any]) {
        self.init()
        self.attributes = attributes
    }
    
    subscript(key: NSAttributedStringKey) -> Any? {
        set {
            self.attributes[key] = newValue
        }
        get {
            return self.attributes[key]
        }
    }
}

extension AttributesBuilder {
    
    public var copied: AttributesBuilder {
        
        var dict = self.attributes
        
        if let style = self.attributes[.paragraphStyle] as? NSMutableParagraphStyle {
            dict[.paragraphStyle] = style.mutableCopy()
        }
        
        return AttributesBuilder(attributes: dict)
    }
}

public enum LigatureStyle: Int {
    case none       = 0
    case `default`  = 1
}

public enum VerticalGlyphFormStyle: Int {
    case horizontal = 0
    case vertical   = 1
}

extension AttributesBuilder {
    
    // NSFontAttributeName
    public func font(_ font: UIFont) -> Self {
        self[.font] = font
        return self
    }
    
    // NSForegroundColorAttributeName
    public func color(_ color: UIColor) -> Self {
        self[.foregroundColor] = color
        return self
    }
    
    // NSBackgroundColorAttributeName
    public func backgroundColor(_ color: UIColor) -> Self {
        self[.backgroundColor] = color
        return self
    }
    
    // NSLigatureAttributeName
    public func ligature(_ style: LigatureStyle) -> Self {
        self[.ligature] = style.rawValue
        return self
    }
    
    // NSKernAttributeName
    public func characterSpacing(_ spacing: CGFloat) -> Self {
        self[.kern] = spacing
        return self
    }
    
    // NSStrikethroughStyleAttributeName
    public func strikethroughStyle(_ style: NSUnderlineStyle) -> Self {
        self[.strikethroughStyle] = style.rawValue
        return self
    }
    
    // NSStrikethroughColorAttributeName
    public func strikethroughColor(_ color: UIColor) -> Self {
        self[.strikethroughColor] = color
        return self
    }
    
    // NSUnderlineStyleAttributeName
    public func underlineStyle(_ style: NSUnderlineStyle) -> Self {
        self[.underlineStyle] = style.rawValue
        return self
    }
    
    // NSUnderlineColorAttributeName
    public func underlineColor(_ color: UIColor) -> Self {
        self[.underlineColor] = color
        return self
    }
    
    // NSStrokeWidthAttributeName
    public func strokeWidth(_ width: CGFloat) -> Self {
        self[.strokeWidth] = width
        return self
    }
    
    // NSStrokeColorAttributeName
    public func strokeColor(_ color: UIColor) -> Self {
        self[.strokeColor] = color
        return self
    }
    
    // NSShadowAttributeName
    public func shadow(_ value: NSShadow) -> Self {
        self[.shadow] = value
        return self
    }
    
    // NSTextEffectAttributeName
    public func textEffect(_ effect: NSAttributedString.TextEffectStyle) -> Self {
        self[.textEffect] = effect.rawValue
        return self
    }
    
    // NSAttachmentAttributeName
    public func attachment(_ value: NSTextAttachment) -> Self {
        self[.attachment] = value
        return self
    }
    
    // NSLinkAttributeName
    public func link(_ url: URL) -> Self {
        self[.link] = url
        return self
    }
    
    // NSBaselineOffsetAttributeName
    public func baselineOffset(_ offset: CGFloat) -> Self {
        self[.baselineOffset] = offset
        return self
    }
    
    // NSObliquenessAttributeName
    public func obliqueness(_ value: CGFloat) -> Self {
        self[.obliqueness] = value
        return self
    }
    
    // NSExpansionAttributeName
    public func expansion(_ value: CGFloat) -> Self {
        self[.expansion] = value
        return self
    }
    
    // NSVerticalGlyphFormAttributeName
    public func verticalGlyphForm(_ style: VerticalGlyphFormStyle) -> Self {
        self[.verticalGlyphForm] = style.rawValue
        return self
    }
}

extension AttributesBuilder {
    
    var paragraphStyle: NSMutableParagraphStyle {
        return self[.paragraphStyle] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
    }
    
    // NSParagraphStyleAttributeName - alignment
    public func alignment(_ mode: NSTextAlignment) -> Self {
        let style = self.paragraphStyle
        style.alignment = mode
        self[.paragraphStyle] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - firstLineHeadIndent
    public func firstLineHeadIndent(_ indent: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.firstLineHeadIndent = indent
        self[.paragraphStyle] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - headIndent
    public func headIndent(_ indent: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.headIndent = indent
        self[.paragraphStyle] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - tailIndent
    public func tailIndent(_ indent: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.tailIndent = indent
        self[.paragraphStyle] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - lineBreakMode
    public func lineBreakMode(_ mode: NSLineBreakMode) -> Self {
        let style = self.paragraphStyle
        style.lineBreakMode = mode
        self[.paragraphStyle] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - minimumLineHeight
    public func minimumLineHeight(_ height: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.minimumLineHeight = height
        self[.paragraphStyle] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - maximumLineHeight
    public func maximumLineHeight(_ height: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.maximumLineHeight = height
        self[.paragraphStyle] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - lineSpacing
    public func lineSpacing(_ spacing: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.lineSpacing = spacing
        self[.paragraphStyle] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - paragraphSpacing
    public func paragraphSpacing(_ spacing: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.paragraphSpacing = spacing
        self[.paragraphStyle] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - paragraphSpacingBefore
    public func paragraphSpacingBefore(_ spacingBefore: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.paragraphSpacingBefore = spacingBefore
        self[.paragraphStyle] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - baseWritingDirection
    public func baseWritingDirection(_ direction: NSWritingDirection) -> Self {
        let style = self.paragraphStyle
        style.baseWritingDirection = direction
        self[.paragraphStyle] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - lineHeightMultiple
    public func lineHeightMultiple(_ height: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.lineHeightMultiple = height
        self[.paragraphStyle] = style
        return self
    }
}
