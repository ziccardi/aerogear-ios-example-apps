import Apollo
import Kingfisher
import UIKit
import AGSSync

class MemesTableViewCell: UITableViewCell {

    var memeId: String?

    @IBOutlet var likesLabel: UILabel!
    @IBOutlet var memeImageView: UIImageView!
    @IBOutlet var userLabel:UILabel!
    @IBOutlet var avatarImageView:UIImageView!

    func configure(with meme: AllMemesQuery.Data.AllMeme) {
        memeId = meme.id
        let url = URL(string: meme.photourl)
        memeImageView.kf.setImage(with: url, placeholder: UIImage(named: "loading"))
        likesLabel?.text = "\(meme.likes) likes"
        userLabel?.text = meme.owner
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }

    @IBAction func upvote(_ sender: UIButton) {
        guard let memeId = memeId else { return }
        let uiApp = UIApplication.shared.keyWindow?.rootViewController
        AgsSync.instance.client?.perform(mutation: LikeMemeMutation(memeId: memeId)) { result, _ in
            if result != nil {
                let alert = UIAlertController(title: "Success", message: "Like submitted!", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                uiApp?.present(alert, animated: true)
                self.disableLikeButton(likeButton: sender)


            } else {
                let alert = UIAlertController(title: "Error", message: "Failed to send a like to meme", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                uiApp?.present(alert, animated: true)
            }

            return
        }
    }

    func disableLikeButton(likeButton: UIButton) {
        likeButton.setBackgroundImage(UIImage(named: "favorite"), for: UIControlState.normal)
        likeButton.isUserInteractionEnabled = false;
    }
}
