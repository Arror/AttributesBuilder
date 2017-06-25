import Foundation

public protocol AttributesContainer {
        
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

extension Dictionary where Key == NSAttributedStringKey, Value == Any {
    
    var copied: Dictionary {
        
        var copied = self
        
        if let style = self[.paragraphStyle] as? NSParagraphStyle {
            
            style.mutableCopy()
            
            copied[.paragraphStyle] = style
        }
        
        return copied
    }
}
