//
//  UIImage.swift
//  LuckyToolKit
//
//  Created by junky on 2022/3/4.
//

import UIKit


public extension UIImage {
    
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.setFillColor(color.cgColor)
        context.fill(rect)
        guard let image = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else { return nil }
        self.init(cgImage: image)
    }
    
    
    func scaled(toSize newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: newSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    func cropped(toRect rect: CGRect) -> UIImage? {
        guard let cgImage = cgImage?.cropping(to: rect) else { return nil }
        return UIImage(cgImage: cgImage)
    }
    
    func rotated(byDegrees degrees: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.translateBy(x: size.width / 2, y: size.height / 2)
        context.rotate(by: degrees * .pi / 180)
        draw(in: CGRect(x: -size.width / 2, y: -size.height / 2, width: size.width, height: size.height))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    
    func withWatermark(text: String, point: CGPoint, attributes: [NSAttributedString.Key: Any]) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(at: .zero)
        (text as NSString).draw(at: point, withAttributes: attributes)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    
    func saveToPhotosAlbum() {
        UIImageWriteToSavedPhotosAlbum(self, nil, nil, nil)
    }
    
    func compressed(quality: CGFloat) -> UIImage? {
        guard let data = jpegData(compressionQuality: quality) else { return nil }
        return UIImage(data: data)
    }
    
    func rounded(cornerRadius: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        let rect = CGRect(origin: .zero, size: size)
        UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
        draw(in: rect)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
}





