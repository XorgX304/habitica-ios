//
//  UIView-Extensions.swift
//  Habitica
//
//  Created by Phillip Thelen on 01/03/2017.
//  Copyright © 2017 HabitRPG Inc. All rights reserved.
//

import Foundation

extension UIView {
    
    class func fromNib<T: UIView>(nibName: String? = nil) -> T? {
        guard let nibs = Bundle.main.loadNibNamed(nibName ?? String(describing: T.self), owner: nil, options: nil) else {
            return nil
        }
        guard let view = nibs[0] as? T else {
            return nil
        }
        return view
    }
    
    @objc
    class func loadFromNib(nibName: String) -> UIView? {
        guard let nibs = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil) else {
            return nil
        }
        return nibs[0] as? UIView
    }
    
    @objc
    func viewFromNibForClass() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        
        return view
    }
    
    func addTopBorderWithColor(color: UIColor, width: CGFloat) -> CALayer {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
        return border
    }
    
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
}
