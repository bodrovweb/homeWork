import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillShow (notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide (notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func shouldPerformSegue (withIdentifier: String, sender: Any?) -> Bool {
        let result = checkUserCredentials()
        if !result {
            showAlert()
        }
        return result
    }
    
    
    @objc func keyboardwillShow (notification: Notification) {
        guard let kbsize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return}
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: kbsize.height, right: 0)
        scrollView.contentInset = insets
    }
    
    @objc func keyboardWillHide (notification: Notification) {
        let insets = UIEdgeInsets.zero
        scrollView.contentInset = insets
    }
    
    func checkUserCredentials() -> Bool {
        return loginField.text! == "admin" && passwordField.text! == "123"
    }

    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "log: admin / pass: 123", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func signinButton(_ sender: UIButton) {
        
        
        
    }
}

