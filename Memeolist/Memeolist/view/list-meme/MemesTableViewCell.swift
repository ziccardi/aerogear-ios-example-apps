import Apollo
import Kingfisher
import UIKit

class MemesTableViewCell: UITableViewCell {

    var memeId: String?

    @IBOutlet var likesLabel: UILabel!
    @IBOutlet var memeImageView: UIImageView!

    func configure(with meme: AllMemesQuery.Data.AllMeme) {
        memeId = meme.id
        let url = URL(string: meme.photourl)
        memeImageView.kf.setImage(with: url, placeholder: UIImage(named: "loading"))
        likesLabel?.text = "0 likes" //"\(meme.votes ?? 0) likes"
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }

    @IBAction func upvote() {
        guard let memeId = memeId else { return }
        // TODO: implement mutation
//        apollo.perform(mutation: UpvoteMemeMutation(memeId: memeId)) { (result, error) in
//            if let error = error {
//                NSLog("Error while attempting to upvote post: \(error.localizedDescription)")
//            }
//        }
    }
}
