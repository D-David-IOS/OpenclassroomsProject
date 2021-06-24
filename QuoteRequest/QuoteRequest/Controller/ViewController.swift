//
//  ViewController.swift
//  QuoteRequest
//
//  Created by Debehogne David on 22/06/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var newQuoteButton: UIButton!
    @IBOutlet weak var authorLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addShadowToQuoteLabel()
    }

    private func addShadowToQuoteLabel(){
        quoteLabel.layer.shadowColor = UIColor.black.cgColor
        quoteLabel.layer.shadowOpacity = 0.9
        quoteLabel.layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    
    @IBAction func tappedNewQuoteButton(_ sender: Any) {
        QuoteService.getQuote { (success, quote) in
            if success, let quote = quote {
                self.update(quote: quote)
            } else {
                self.presentAlert()
            }
        }
    }
    
    private func update(quote : Quote){
        quoteLabel.text = quote.text
        authorLabel.text = quote.author
        imageView.image = UIImage(data: quote.imageData)
    }
    
    private func presentAlert() {
        let alertVC = UIAlertController(title: "error", message: "the quote download failed", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC,animated: true,completion: nil)
    }
}

