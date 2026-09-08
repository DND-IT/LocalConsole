//
//  Extensions.swift
//
//  Created by Duraid Abdul.
//  Copyright © 2021 Duraid Abdul. All rights reserved.
//

import UIKit

extension UIScreen {
    
    /// Screen size.
    static var size: CGSize {
        return UIScreen.main.bounds.size
    }
    
    static var portraitSize: CGSize {
        return CGSize(width: UIScreen.main.nativeBounds.width / UIScreen.main.nativeScale,
                      height: UIScreen.main.nativeBounds.height / UIScreen.main.nativeScale)
    }
    
    static var hasRoundedCorners = UIScreen.main.value(forKey: "_" + "display" + "Corner" + "Radius") as! CGFloat > 0
}

@available(iOSApplicationExtension, unavailable)
extension UIApplication {
    /// The foreground scene's window.
    var activeWindow: UIWindow? {
        let windowScene = connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first { $0.activationState == .foregroundActive }

        return windowScene?.keyWindow ?? windowScene?.windows.first
    }

    var statusBarHeight: CGFloat {
        activeWindow?.safeAreaInsets.top ?? 0
    }
}

extension UIFont {
    class func systemFont(ofSize size: CGFloat, weight: UIFont.Weight, design: UIFontDescriptor.SystemDesign) -> UIFont {
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body).addingAttributes([UIFontDescriptor.AttributeName.traits : [UIFontDescriptor.TraitKey.weight : weight]]).withDesign(design)
        
        return UIFont(descriptor: descriptor!, size: size)
    }
}

extension UIControl {
    func addActions(highlightAction: UIAction, unhighlightAction: UIAction) {
        addAction(highlightAction, for: .touchDown)
        addAction(highlightAction, for: .touchDragEnter)
        
        addAction(unhighlightAction, for: .touchUpInside)
        addAction(unhighlightAction, for: .touchDragExit)
        addAction(unhighlightAction, for: .touchCancel)
    }
}

extension UIView {
    func roundOriginToPixel() {
        frame.origin.x = (round(frame.origin.x * UIScreen.main.scale)) / UIScreen.main.scale
        frame.origin.y = (round(frame.origin.y * UIScreen.main.scale)) / UIScreen.main.scale
    }
}
