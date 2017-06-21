import Foundation

public protocol AttributesContainer {
    
    var attributes: [NSAttributedStringKey : Any] { get }
    
    init(_ initialBlock: (inout Self) -> Void)
    
    func copy(_ copyBlock: (inout Self) -> Void) -> Self
    
    mutating func font(_ font: @autoclosure () -> UIFont)
    
    mutating func color(_ color: @autoclosure () -> UIColor)
    
    mutating func backgroundColor(_ color: @autoclosure () -> UIColor)
    
    mutating func ligature(_ style: @autoclosure () -> NSAttributedString.LigatureStyle)
    
    mutating func characterSpacing(_ spacing: @autoclosure () -> CGFloat)
    
    mutating func strikethroughStyle(_ style: @autoclosure () -> NSUnderlineStyle)
    
    mutating func strikethroughColor(_ color: @autoclosure () -> UIColor)
    
    mutating func underlineStyle(_ style: @autoclosure () -> NSUnderlineStyle)
    
    mutating func underlineColor(_ color: @autoclosure () -> UIColor)
    
    mutating func strokeWidth(_ width: @autoclosure () -> CGFloat)
    
    mutating func strokeColor(_ color: @autoclosure () -> UIColor)
    
    mutating func shadow(_ value: @autoclosure () -> NSShadow)
    
    mutating func textEffect(_ effect: @autoclosure () -> NSAttributedString.TextEffectStyle)
    
    mutating func attachment(_ value: @autoclosure () -> NSTextAttachment)
    
    mutating func link(_ url: @autoclosure () -> URL)
    
    mutating func baselineOffset(_ offset: @autoclosure () -> CGFloat)
    
    mutating func obliqueness(_ value: @autoclosure () -> CGFloat)
    
    mutating func expansion(_ value: @autoclosure () -> CGFloat)
    
    mutating func verticalGlyphForm(_ style: @autoclosure () -> NSAttributedString.VerticalGlyphFormStyle)
    
    mutating func paragraphStyle(_ style: @autoclosure () -> NSParagraphStyle)
}

extension AttributesContainer {
    
    internal func build() -> [NSAttributedStringKey: Any] {
        
        var copied = self.attributes
        
        if let style = self.attributes[.paragraphStyle] as? NSParagraphStyle {
            
            style.mutableCopy()
            
            copied[.paragraphStyle] = style
        }
        
        return copied
    }
}

internal protocol _AttributesContainer: AttributesContainer {
    
    var attributes: [NSAttributedStringKey : Any] { get set }
    
    init(attributes: [NSAttributedStringKey: Any])
}

extension _AttributesContainer {
    
    private init() {
        
        self.init(attributes: [:])
    }
    
    private subscript(_ key: NSAttributedStringKey) -> Any? {
        set {
            self.attributes[key] = newValue
        }
        get {
            return self.attributes[key]
        }
    }
}

extension _AttributesContainer {
    
    public init(_ initialBlock: (inout Self) -> Void) {
        
        self.init()
        
        initialBlock(&self)
    }
    
    public func copy(_ copyBlock: (inout Self) -> Void) -> Self {
        
        var builder = type(of: self).init(attributes: self.build())
        
        copyBlock(&builder)
        
        return builder
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

extension _AttributesContainer {
    
    // NSFontAttributeName
    public mutating func font(_ font: @autoclosure () -> UIFont) {
        self[.font] = font()
    }
    
    // NSForegroundColorAttributeName
    public mutating func color(_ color: @autoclosure () -> UIColor) {
        self[.foregroundColor] = color()
    }
    
    // NSBackgroundColorAttributeName
    public mutating func backgroundColor(_ color: @autoclosure () -> UIColor) {
        self[.backgroundColor] = color()
    }
    
    // NSLigatureAttributeName
    public mutating func ligature(_ style: @autoclosure () -> NSAttributedString.LigatureStyle) {
        self[.ligature] = style().rawValue
    }
    
    // NSKernAttributeName
    public mutating func characterSpacing(_ spacing: @autoclosure () -> CGFloat) {
        self[.kern] = spacing()
    }
    
    // NSStrikethroughStyleAttributeName
    public mutating func strikethroughStyle(_ style: @autoclosure () -> NSUnderlineStyle) {
        self[.strikethroughStyle] = style()
    }
    
    // NSStrikethroughColorAttributeName
    public mutating func strikethroughColor(_ color: @autoclosure () -> UIColor) {
        self[.strikethroughColor] = color()
    }
    
    // NSUnderlineStyleAttributeName
    public mutating func underlineStyle(_ style: @autoclosure () -> NSUnderlineStyle) {
        self[.underlineStyle] = style()
    }
    
    // NSUnderlineColorAttributeName
    public mutating func underlineColor(_ color: @autoclosure () -> UIColor) {
        self[.underlineColor] = color()
    }
    
    // NSStrokeWidthAttributeName
    public mutating func strokeWidth(_ width: @autoclosure () -> CGFloat) {
        self[.strokeWidth] = width()
    }
    
    // NSStrokeColorAttributeName
    public mutating func strokeColor(_ color: @autoclosure () -> UIColor) {
        self[.strokeColor] = color()
    }
    
    // NSShadowAttributeName
    public mutating func shadow(_ value: @autoclosure () -> NSShadow) {
        self[.shadow] = value()
    }
    
    // NSTextEffectAttributeName
    public mutating func textEffect(_ effect: @autoclosure () -> NSAttributedString.TextEffectStyle) {
        self[.textEffect] = effect()
    }
    
    // NSAttachmentAttributeName
    public mutating func attachment(_ value: @autoclosure () -> NSTextAttachment) {
        self[.attachment] = value()
    }
    
    // NSLinkAttributeName
    public mutating func link(_ url: @autoclosure () -> URL) {
        self[.link] = url()
    }
    
    // NSBaselineOffsetAttributeName
    public mutating func baselineOffset(_ offset: @autoclosure () -> CGFloat) {
        self[.baselineOffset] = offset()
    }
    
    // NSObliquenessAttributeName
    public mutating func obliqueness(_ value: @autoclosure () -> CGFloat) {
        self[.obliqueness] = value()
    }
    
    // NSExpansionAttributeName
    public mutating func expansion(_ value: @autoclosure () -> CGFloat) {
        self[.expansion] = value()
    }
    
    // NSVerticalGlyphFormAttributeName
    public mutating func verticalGlyphForm(_ style: @autoclosure () -> NSAttributedString.VerticalGlyphFormStyle) {
        self[.verticalGlyphForm] = style().rawValue
    }
    
    // NSParagraphStyleAttributeName
    public mutating func paragraphStyle(_ style: @autoclosure () -> NSParagraphStyle) {
        self[.paragraphStyle] = style()
    }
}
