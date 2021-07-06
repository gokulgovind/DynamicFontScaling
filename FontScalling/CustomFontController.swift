//
//  CustomFontController.swift
//  FontScalling
//
//  Created by Gokul G on 05/07/21.
//

import UIKit

class CustomFontController: UIViewController {

    @IBOutlet weak var largetitle:UILabel!
    
    @IBOutlet weak var title1:UILabel!
    @IBOutlet weak var title2:UILabel!
    @IBOutlet weak var title3:UILabel!
    
    @IBOutlet weak var Headline:UILabel!
    @IBOutlet weak var subheadline:UILabel!
    @IBOutlet weak var body:UILabel!
    @IBOutlet weak var Callout:UILabel!
    
    @IBOutlet weak var Footnote:UILabel!
    @IBOutlet weak var Caption1:UILabel!
    @IBOutlet weak var Caption2:UILabel!
    
    @IBOutlet weak var image:UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFont()
        image.adjustsImageSizeForAccessibilityContentSizeCategory = true
        NotificationCenter.default.addObserver(self, selector: #selector(setFont), name: UIAccessibility.boldTextStatusDidChangeNotification, object: nil)
    }
    
    
    @objc func setFont() {
        largetitle.adjustsFontForContentSizeCategory = true
        title1.adjustsFontForContentSizeCategory = true
        title2.adjustsFontForContentSizeCategory = true
        title3.adjustsFontForContentSizeCategory = true
        Headline.adjustsFontForContentSizeCategory = true
        subheadline.adjustsFontForContentSizeCategory = true
        body.adjustsFontForContentSizeCategory = true
        Callout.adjustsFontForContentSizeCategory = true
        Footnote.adjustsFontForContentSizeCategory = true
        Caption1.adjustsFontForContentSizeCategory = true
        Caption2.adjustsFontForContentSizeCategory = true
        
        largetitle.font = UIFont.set(font: .regular, size: 34, style: .largeTitle)
        title1.font = UIFont.set(font: .regular, size: 28, style: .title1)
        title2.font = UIFont.set(font: .regular, size: 22, style: .title2)
        title3.font = UIFont.set(font: .regular, size: 20, style: .title3)
        Headline.font = UIFont.set(font: .semibold, size: 17, style: .headline)
        subheadline.font = UIFont.set(font: .regular, size: 15, style: .subheadline)
        body.font = UIFont.set(font: .regular, size: 17, style: .body)
        Callout.font = UIFont.set(font: .regular, size: 16, style: .callout)
        Footnote.font = UIFont.set(font: .regular, size: 13, style: .footnote)
        Caption1.font = UIFont.set(font: .regular, size: 12, style: .caption1)
        Caption2.font = UIFont.set(font: .regular, size: 11, style: .caption2)
    }
}


public extension UIFont {
    enum CustomFonts:String {
        case light = "Lato-Light"
        case regular = "Lato-Regular"
        case medium = "Lato-Medium"
        case semibold = "Lato-Semibold"
        case bold = "Lato-Bold"
        case black = "Lato-Black"
        case italic = "Lato-Italic"
        case boldItalic = "Lato-BoldItalic"
    }
    
    enum StandardSize:CGFloat {
        case ten = 10
        case eleven = 11
        case twelve = 12
        case fourteen = 14
        case sixteen = 16
        case seventeen = 17
        case eighteen = 18
        case twenety = 20
    }

    static func set(font:CustomFonts, size:CGFloat, style: UIFont.TextStyle) -> UIFont {
        // 1. Int a FontDescriptor
        var fontDescriptor = UIFontDescriptor(name: font.rawValue, size: size)
        // 2. Check is bold enabled
        if UIAccessibility.isBoldTextEnabled, let boldDescriptor = fontDescriptor.withSymbolicTraits(.traitBold) {
            // 2a. Add bold to FontDescriptor
            fontDescriptor = boldDescriptor
        }
        // 3. Convert FontDescriptor to UIFont
        let returnValue = UIFont(descriptor: fontDescriptor, size: size)
        // 4. Use FontMetrics to scale the font as per settings
        let fMetrics = UIFontMetrics(forTextStyle: style).scaledFont(for: returnValue)
        return fMetrics
    }
}
