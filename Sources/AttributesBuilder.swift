import UIKit

public struct AttributesBuilder: AttributesContainer {
    
    public internal(set) var attributes: [NSAttributedStringKey : Any]
    
    init(_ attributes: [NSAttributedStringKey : Any] = [:]) {
        
        self.attributes = [:]
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

