//
//  NSString.swift
//  DrawText
//
//  Created by Furuyama Takeshi on 2015/07/18.
//  Copyright (c) 2015年 Furuyama Takeshi. All rights reserved.
//

import UIKit

extension NSString {
    
    class func sizeOfAttributeString(str: NSAttributedString, maxWidth: CGFloat) -> CGSize {
        let size = str.boundingRectWithSize(CGSizeMake(maxWidth, 1000), options:(NSStringDrawingOptions.UsesLineFragmentOrigin), context:nil).size
        return size
    }
    
    class func imageFromText(text:NSString, font:UIFont, maxWidth:CGFloat, color:UIColor) -> UIImage {
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = NSLineBreakMode.ByWordWrapping
        paragraph.alignment = .Left // potentially this can be an input param too, but i guess in most use cases we want center align
        
        let attributedString = NSAttributedString(string: text as String, attributes: [NSFontAttributeName: font, NSForegroundColorAttributeName: color, NSParagraphStyleAttributeName:paragraph])
        
        let size = sizeOfAttributeString(attributedString, maxWidth: maxWidth)
        UIGraphicsBeginImageContextWithOptions(size, false , 0.0)
        attributedString.drawInRect(CGRectMake(0, 0, size.width, size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}