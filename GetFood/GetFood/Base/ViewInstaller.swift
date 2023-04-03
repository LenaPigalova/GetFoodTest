//
//  ViewInstaller.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation
import UIKit

protocol ViewInstaller: class {
    var mainView: UIView { get }
    func setupSubviews()
    func initSubviews()
    func embedSubviews()
    func addSubviewsConstraints()
}

extension ViewInstaller {
    func setupSubviews() {
        initSubviews()
        embedSubviews()
        addSubviewsConstraints()
    }
    
    func setupTargets() {
        
    }
    
    func initSubviews() {
        fatalError("Implementation pending...")
    }
    
    func embedSubviews() {
        fatalError("Implementation pending...")
    }
    
    func addSubviewsConstraints() {
        fatalError("Implementation pending...")
    }
}
