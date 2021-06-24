//
//  QuestionView.swift
//  OpenQuizz
//
//  Created by Debehogne David on 21/05/2021.
//

import UIKit

class QuestionView: UIView {

    @IBOutlet private var label: UILabel!
    @IBOutlet private var icon: UIImageView!
    
    enum Style{
        case correct, incorrect, standard
    }
    
    var style: Style = .standard{
        didSet{
            setStyle(style)
        }
    }
    
    private func setStyle(_ style : Style){
        switch style {
        case .correct :
            backgroundColor = UIColor(displayP3Red: 200/255.0, green: 236/255.0, blue: 160/255.0, alpha: 1)
            icon.image = #imageLiteral(resourceName: "Icon Correct")
            icon.isHidden = false
        case .incorrect :
            backgroundColor = UIColor(displayP3Red: 243/255.0, green: 135/255.0, blue: 148/255.0, alpha: 1)
            icon.image = #imageLiteral(resourceName: "Icon Error")
            icon.isHidden = false
        case .standard :
            backgroundColor = UIColor(displayP3Red: 191/255.0, green: 196/255.0, blue: 201/255.0, alpha: 1)
            icon.isHidden = true
        }
    }
    
    var title = "" {
        didSet {
            label.text = title
        }
    }
}
