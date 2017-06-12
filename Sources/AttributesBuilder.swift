import UIKit

public final class AttributesBuilder {
    
    var attributes: [String: Any] = [:]
    
    public init() {}
}

extension AttributesBuilder {
    
    convenience init(attributes: [String: Any]) {
        self.init()
        self.attributes = attributes
    }
    
    subscript(key: String) -> Any? {
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
        
        if let style = self.attributes[NSAttributedStringKey.paragraphStyle.rawValue] as? NSMutableParagraphStyle {
            dict[NSAttributedStringKey.paragraphStyle.rawValue] = style.mutableCopy()
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

public enum TextEffect: String {
    
    case letterpress
    
    public var rawValue: String {
        switch self {
        case .letterpress:
            return NSAttributedString.TextEffectStyle.letterpressStyle.rawValue
        }
    }
}

extension AttributesBuilder {
    
    // NSFontAttributeName
    public func font(_ font: UIFont) -> Self {
        self[NSAttributedStringKey.font.rawValue] = font
        return self
    }
    
    // NSForegroundColorAttributeName
    public func color(_ color: UIColor) -> Self {
        self[NSAttributedStringKey.foregroundColor.rawValue] = color
        return self
    }
    
    // NSBackgroundColorAttributeName
    public func backgroundColor(_ color: UIColor) -> Self {
        self[NSAttributedStringKey.backgroundColor.rawValue] = color
        return self
    }
    
    // NSLigatureAttributeName
    public func ligature(_ style: LigatureStyle) -> Self {
        self[NSAttributedStringKey.ligature.rawValue] = style.rawValue
        return self
    }
    
    // NSKernAttributeName
    public func characterSpacing(_ spacing: CGFloat) -> Self {
        self[NSAttributedStringKey.kern.rawValue] = spacing
        return self
    }
    
    // NSStrikethroughStyleAttributeName
    public func strikethroughStyle(_ style: NSUnderlineStyle) -> Self {
        self[NSAttributedStringKey.strikethroughStyle.rawValue] = style.rawValue
        return self
    }
    
    // NSStrikethroughColorAttributeName
    public func strikethroughColor(_ color: UIColor) -> Self {
        self[NSAttributedStringKey.strikethroughColor.rawValue] = color
        return self
    }
    
    // NSUnderlineStyleAttributeName
    public func underlineStyle(_ style: NSUnderlineStyle) -> Self {
        self[NSAttributedStringKey.underlineStyle.rawValue] = style.rawValue
        return self
    }
    
    // NSUnderlineColorAttributeName
    public func underlineColor(_ color: UIColor) -> Self {
        self[NSAttributedStringKey.underlineColor.rawValue] = color
        return self
    }
    
    // NSStrokeWidthAttributeName
    public func strokeWidth(_ width: CGFloat) -> Self {
        self[NSAttributedStringKey.strokeWidth.rawValue] = width
        return self
    }
    
    // NSStrokeColorAttributeName
    public func strokeColor(_ color: UIColor) -> Self {
        self[NSAttributedStringKey.strokeColor.rawValue] = color
        return self
    }
    
    // NSShadowAttributeName
    public func shadow(_ value: NSShadow) -> Self {
        self[NSAttributedStringKey.shadow.rawValue] = value
        return self
    }
    
    // NSTextEffectAttributeName
    public func textEffect(_ effect: TextEffect) -> Self {
        self[NSAttributedStringKey.textEffect.rawValue] = effect.rawValue
        return self
    }
    
    // NSAttachmentAttributeName
    public func attachment(_ value: NSTextAttachment) -> Self {
        self[NSAttributedStringKey.attachment.rawValue] = value
        return self
    }
    
    // NSLinkAttributeName
    public func link(_ url: URL) -> Self {
        self[NSAttributedStringKey.link.rawValue] = url
        return self
    }
    
    // NSBaselineOffsetAttributeName
    public func baselineOffset(_ offset: CGFloat) -> Self {
        self[NSAttributedStringKey.baselineOffset.rawValue] = offset
        return self
    }
    
    // NSObliquenessAttributeName
    public func obliqueness(_ value: CGFloat) -> Self {
        self[NSAttributedStringKey.obliqueness.rawValue] = value
        return self
    }
    
    // NSExpansionAttributeName
    public func expansion(_ value: CGFloat) -> Self {
        self[NSAttributedStringKey.expansion.rawValue] = value
        return self
    }
    
    // NSVerticalGlyphFormAttributeName
    public func verticalGlyphForm(_ style: VerticalGlyphFormStyle) -> Self {
        self[NSAttributedStringKey.verticalGlyphForm.rawValue] = style.rawValue
        return self
    }
}

extension AttributesBuilder {
    
    var paragraphStyle: NSMutableParagraphStyle {
        return self[NSAttributedStringKey.paragraphStyle.rawValue] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
    }
    
    // NSParagraphStyleAttributeName - alignment
    public func alignment(_ mode: NSTextAlignment) -> Self {
        let style = self.paragraphStyle
        style.alignment = mode
        self[NSAttributedStringKey.paragraphStyle.rawValue] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - firstLineHeadIndent
    public func firstLineHeadIndent(_ indent: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.firstLineHeadIndent = indent
        self[NSAttributedStringKey.paragraphStyle.rawValue] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - headIndent
    public func headIndent(_ indent: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.headIndent = indent
        self[NSAttributedStringKey.paragraphStyle.rawValue] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - tailIndent
    public func tailIndent(_ indent: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.tailIndent = indent
        self[NSAttributedStringKey.paragraphStyle.rawValue] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - lineBreakMode
    public func lineBreakMode(_ mode: NSLineBreakMode) -> Self {
        let style = self.paragraphStyle
        style.lineBreakMode = mode
        self[NSAttributedStringKey.paragraphStyle.rawValue] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - minimumLineHeight
    public func minimumLineHeight(_ height: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.minimumLineHeight = height
        self[NSAttributedStringKey.paragraphStyle.rawValue] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - maximumLineHeight
    public func maximumLineHeight(_ height: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.maximumLineHeight = height
        self[NSAttributedStringKey.paragraphStyle.rawValue] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - lineSpacing
    public func lineSpacing(_ spacing: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.lineSpacing = spacing
        self[NSAttributedStringKey.paragraphStyle.rawValue] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - paragraphSpacing
    public func paragraphSpacing(_ spacing: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.paragraphSpacing = spacing
        self[NSAttributedStringKey.paragraphStyle.rawValue] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - paragraphSpacingBefore
    public func paragraphSpacingBefore(_ spacingBefore: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.paragraphSpacingBefore = spacingBefore
        self[NSAttributedStringKey.paragraphStyle.rawValue] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - baseWritingDirection
    public func baseWritingDirection(_ direction: NSWritingDirection) -> Self {
        let style = self.paragraphStyle
        style.baseWritingDirection = direction
        self[NSAttributedStringKey.paragraphStyle.rawValue] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - lineHeightMultiple
    public func lineHeightMultiple(_ height: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.lineHeightMultiple = height
        self[NSAttributedStringKey.paragraphStyle.rawValue] = style
        return self
    }
}
