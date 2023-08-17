//
//  AboutAuthorViewContoller.swift
//  DiceGame-PO
//
//  Created by user229774 on 2/25/23.
//

import UIKit

class AboutAuthorViewContoller: UIViewController {

    @IBOutlet var authorImage: UIImageView!
    @IBOutlet var backToGameButton: UIButton!
    @IBOutlet var contactButton: UIButton!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authorImage.layer.masksToBounds = true
        authorImage.layer.cornerRadius = 50
        
        descriptionLabel.text = "As a Graduate Student at Syracuse University pursuing Computer Science, I have knowledge and experience in various programming languages like C, Java, Python, including HTML, CSS, JavaScript, and SQL. I am also currently learning Mobile Application Development by building iOS applications. I am actively building small-scale applications as a part of my learning process. With this diverse skill set and a willingness to learn new technologies, I am determined to become a skilled software engineer who can design, develop, and maintain complex software applications and systems."
       
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }

    @IBAction func contactButton(_ sender: UIButton) {
        let alertController = UIAlertController(title: "For inquires", message: "Contact at: abc@gmail.com", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }
    
    @IBAction func dismissToMainPage(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
