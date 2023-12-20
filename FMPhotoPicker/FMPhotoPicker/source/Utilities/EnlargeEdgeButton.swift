//
//  EnlargeEdgeButton.swift
//  FMPhotoPicker
//
//  Created by Omega on 2023/12/13.
//  Copyright © 2023 Cong Nguyen. All rights reserved.
//

import UIKit

open class EnlargeEdgeButton: UIButton {
    
    open var enlargeEdge: UIEdgeInsets = .zero
    
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if alpha == 0 || isHidden == true || enlargeEdge == .zero {
            return super.hitTest(point, with: event)
        }
        let rect = bounds.enlargeRect(edgeInsets: enlargeEdge)
        return rect.contains(point) ? self : nil
    }
}

extension CGRect {
    public func enlargeRect(edgeInsets: UIEdgeInsets) -> CGRect {
        return CGRect(x: minX - edgeInsets.left, y: minY - edgeInsets.top, width: width + (edgeInsets.left + edgeInsets.right), height: height + (edgeInsets.top + edgeInsets.bottom))
    }
}
