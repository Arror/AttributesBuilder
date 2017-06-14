import UIKit
import AttributesBuilder

class ViewController: UIViewController {

    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let builder1 = AttributesBuilder()
            .color(.darkGray)
            .font(.systemFont(ofSize: 14.0))
        
        let builder2 = builder1
            .copied
            .font(.systemFont(ofSize: 24.0))
        
        let builder3 = AttributesBuilder()
            .color(.red)
            .font(.boldSystemFont(ofSize: 18.0))
        
        let content = "CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It has over 30 thousand libraries and is used in over 1.9 million apps. CocoaPods can help you scale your projects elegantly."
        
        self.contentLabel.attributedText = content
            .rs.rendered(by: builder1)
            .rs.rendered(by: builder2, range: 0..<1)
            .rs.rendered(by: builder3, regexPattern: "Swift and Objective-C")
    }
}

