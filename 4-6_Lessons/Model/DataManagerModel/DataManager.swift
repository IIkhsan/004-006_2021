//
//  DataManager.swift
//  4-6_Lessons
//
//  Created by Renat Murtazin on 13.10.2021.
//

import Foundation
import UIKit

class DataManager {
    
    // MARK: - Initialization of data for users
    
    let firstUserNewsFieldPosts: [NewsFieldPost] = [NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage"), newsFieldProfileName: "travisscott", newsFieldPostImage: UIImage(named: "image1"), newsFieldPostText: "UTOPIA"), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage"), newsFieldProfileName: "travisscott", newsFieldPostImage: UIImage(named: "image2"), newsFieldPostText: "CACTUS JACK FOR CR MEN"), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage"), newsFieldProfileName: "travisscott", newsFieldPostImage: UIImage(named: "image3"), newsFieldPostText: nil), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage"), newsFieldProfileName: "travisscott", newsFieldPostImage: UIImage(named: "image4"), newsFieldPostText: "Home office"), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage"), newsFieldProfileName: "travisscott", newsFieldPostImage: UIImage(named: "image5"), newsFieldPostText: "Life is a movie. So is this album @cactusjack and @a24 set out to bring amazing content for the future. Thru film and media. Startig with this."), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage"), newsFieldProfileName: "travisscott", newsFieldPostImage: UIImage(named: "image6"), newsFieldPostText: nil), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage"), newsFieldProfileName: "travisscott", newsFieldPostImage: UIImage(named: "image7"), newsFieldPostText: "Everything is everything"), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage"), newsFieldProfileName: "travisscott", newsFieldPostImage: nil, newsFieldPostText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quis nunc vulputate, cursus ante ut, ultricies mi. Duis sed dui a neque tempor interdum in at arcu. Phasellus hendrerit accumsan consequat. Donec placerat tortor eu ligula elementum maximus. Aenean gravida commodo turpis et posuere. In dapibus enim augue, at suscipit turpis eleifend quis. Morbi sagittis ante sed commodo imperdiet."), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage"), newsFieldProfileName: "travisscott", newsFieldPostImage: nil, newsFieldPostText: "Nulla facilisi. Cras sodales fermentum nulla, ac tristique felis pharetra sed. Nunc iaculis tortor vel turpis condimentum, quis dignissim ligula dapibus. Pellentesque a ultrices turpis. Donec blandit at nisl ac semper. Cras nec fermentum eros. Integer viverra felis quis mauris efficitur placerat. Integer velit enim, efficitur at consectetur vel, maximus eu lorem. Mauris fermentum non enim id hendrerit."), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage"), newsFieldProfileName: "travisscott", newsFieldPostImage: nil, newsFieldPostText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris faucibus, quam et molestie facilisis, purus turpis viverra ante, euismod porttitor mi metus eu ligula. Donec fringilla eget ex at tincidunt. Curabitur velit dolor, tempus ac quam pulvinar, aliquet commodo sapien. Nunc eget laoreet ante. Nulla efficitur, nunc sed aliquet euismod, nibh lacus mollis lacus, eget hendrerit sapien tortor ut turpis. Sed eget nibh in nisl dapibus ornare. In eu interdum magna. Proin congue interdum enim, a suscipit tortor venenatis in. In dolor justo, venenatis sit amet dolor ut, condimentum lobortis libero. Donec enim enim, luctus in lectus in, malesuada eleifend mauris.")]
    
    let secondUserNewsFieldPosts: [NewsFieldPost] = [NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage2"), newsFieldProfileName: "thuggerthugger1", newsFieldPostImage: UIImage(named: "image8"), newsFieldPostText: "PUNK!!"), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage2"), newsFieldProfileName: "thuggerthugger1", newsFieldPostImage: UIImage(named: "image9"), newsFieldPostText: "Added a couple friends... PUNK @midnight PST/3am EST"), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage2"), newsFieldProfileName: "thuggerthugger1", newsFieldPostImage: UIImage(named: "image10"), newsFieldPostText: "PUNK at midnight"), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage2"), newsFieldProfileName: "thuggerthugger1", newsFieldPostImage: nil, newsFieldPostText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In mi sem, iaculis at mi egestas, egestas mattis ex. Duis dapibus ligula at nisl lacinia eleifend. Etiam sodales a massa vitae pulvinar. Cras sed ex eu est tempus hendrerit. Sed eget velit ut ligula tristique hendrerit et in leo. Aliquam ut mollis nibh. Etiam ex erat, volutpat et ultrices eget, iaculis nec leo. Nulla dictum aliquam mauris at pharetra. Quisque ultricies sagittis congue. Maecenas suscipit ullamcorper dignissim. Curabitur ac odio ac purus interdum volutpat non non tortor. Vestibulum tincidunt nulla mattis consectetur faucibus. Fusce non vehicula nisl, aliquet imperdiet lacus. Quisque vitae dolor sit amet ante molestie mollis."), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage2"), newsFieldProfileName: "thuggerthugger1", newsFieldPostImage: UIImage(named: "image11"), newsFieldPostText: "@meekmill trim on this one"), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage2"), newsFieldProfileName: "thuggerthugger1", newsFieldPostImage: UIImage(named: "image12"), newsFieldPostText: "it's lit"), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage2"), newsFieldProfileName: "thuggerthugger1", newsFieldPostImage: nil, newsFieldPostText: "Lorem ipsum"), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage2"), newsFieldProfileName: "thuggerthugger1", newsFieldPostImage: nil, newsFieldPostText: "Fusce tempus ultrices ipsum interdum condimentum. Sed eget interdum sem, eget blandit justo. Nunc quis hendrerit risus. Sed aliquam enim et nulla tempor, sed fringilla dui condimentum. Nullam elementum ligula vel arcu suscipit, quis maximus orci facilisis. Curabitur feugiat ex ligula, eget mattis velit rhoncus eget. Morbi lobortis iaculis risus. Nam aliquet magna vel quam lacinia, vel tincidunt metus fermentum. Duis condimentum volutpat nisi eu rhoncus. Donec laoreet, sem commodo mattis feugiat, mi orci sodales erat, tristique elementum metus odio sit amet libero."), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage2"), newsFieldProfileName: "thuggerthugger1", newsFieldPostImage: nil, newsFieldPostText: "Phasellus dignissim bibendum tellus, vehicula egestas nibh accumsan ut. Quisque nec bibendum libero. Ut fringilla euismod nulla quis pulvinar. Nulla facilisi. Sed vehicula dapibus facilisis. Ut in tellus est. Mauris sit amet lacus convallis nunc auctor euismod sed in enim. Fusce ac fermentum sem. Suspendisse facilisis orci quis dapibus feugiat. Sed nec purus non magna congue efficitur eu nec velit. Fusce rutrum ullamcorper enim nec iaculis."), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage2"), newsFieldProfileName: "thuggerthugger1", newsFieldPostImage: UIImage(named: "image13"), newsFieldPostText: "@strick @kidcudi and I got heat...")]
    
    let thirdUserNewsFieldPosts: [NewsFieldPost] = [NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage3"), newsFieldProfileName: "21savage", newsFieldPostImage: UIImage(named: "image14"), newsFieldPostText: "1 2 3 4..."), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage3"), newsFieldProfileName: "21savage", newsFieldPostImage: UIImage(named: "image15"), newsFieldPostText: "I Give My All Everytime"), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage3"), newsFieldProfileName: "21savage", newsFieldPostImage: UIImage(named: "image16"), newsFieldPostText: "1 year!!!"), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage3"), newsFieldProfileName: "21savage", newsFieldPostImage: nil, newsFieldPostText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In mi sem, iaculis at mi egestas, egestas mattis ex. Duis dapibus ligula at nisl lacinia eleifend. Etiam sodales a massa vitae pulvinar. Cras sed ex eu est tempus hendrerit. Sed eget velit ut ligula tristique hendrerit et in leo. Aliquam ut mollis nibh. Etiam ex erat, volutpat et ultrices eget, iaculis nec leo. Nulla dictum aliquam mauris at pharetra. Quisque ultricies sagittis congue. Maecenas suscipit ullamcorper dignissim. Curabitur ac odio ac purus interdum volutpat non non tortor. Vestibulum tincidunt nulla mattis consectetur faucibus. Fusce non vehicula nisl, aliquet imperdiet lacus. Quisque vitae dolor sit amet ante molestie mollis."), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage3"), newsFieldProfileName: "21savage", newsFieldPostImage: UIImage(named: "image17"), newsFieldPostText: "Mercedes-Benz"), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage3"), newsFieldProfileName: "21savage", newsFieldPostImage: UIImage(named: "image18"), newsFieldPostText: "Big4L"), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage3"), newsFieldProfileName: "21savage", newsFieldPostImage: nil, newsFieldPostText: "Lorem ipsum"), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage3"), newsFieldProfileName: "21savage", newsFieldPostImage: nil, newsFieldPostText: "Young savage why you trapping so hard? Why you niggas capin so hard?"), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage3"), newsFieldProfileName: "21savage", newsFieldPostImage: nil, newsFieldPostText: "Phasellus dignissim bibendum tellus, vehicula egestas nibh accumsan ut. Quisque nec bibendum libero. Ut fringilla euismod nulla quis pulvinar. Nulla facilisi. Sed vehicula dapibus facilisis. Ut in tellus est. Mauris sit amet lacus convallis nunc auctor euismod sed in enim. Fusce ac fermentum sem. Suspendisse facilisis orci quis dapibus feugiat. Sed nec purus non magna congue efficitur eu nec velit. Fusce rutrum ullamcorper enim nec iaculis."), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage3"), newsFieldProfileName: "21savage", newsFieldPostImage: nil, newsFieldPostText: "Boy")]
    
    let firstProfilePosts: [ProfilePost] = [ProfilePost(profilePostFirstImage: #imageLiteral(resourceName: "image1"), profilePostSecondImage: #imageLiteral(resourceName: "image2"), profilePostThirdImage: #imageLiteral(resourceName: "image3")), ProfilePost(profilePostFirstImage: #imageLiteral(resourceName: "image4"), profilePostSecondImage: #imageLiteral(resourceName: "image5"), profilePostThirdImage: #imageLiteral(resourceName: "image6")), ProfilePost(profilePostFirstImage: #imageLiteral(resourceName: "image7"), profilePostSecondImage: nil, profilePostThirdImage: nil)]
    
    let secondProfilePosts: [ProfilePost] = [ProfilePost(profilePostFirstImage: #imageLiteral(resourceName: "image8"), profilePostSecondImage: #imageLiteral(resourceName: "image9"), profilePostThirdImage: #imageLiteral(resourceName: "profileImage2")), ProfilePost(profilePostFirstImage: #imageLiteral(resourceName: "image11"), profilePostSecondImage: #imageLiteral(resourceName: "image12"), profilePostThirdImage: #imageLiteral(resourceName: "image13"))]
    
    let thirdProfilePosts: [ProfilePost] = [ProfilePost(profilePostFirstImage: #imageLiteral(resourceName: "image14"), profilePostSecondImage: #imageLiteral(resourceName: "image18"), profilePostThirdImage: #imageLiteral(resourceName: "image15")), ProfilePost(profilePostFirstImage: #imageLiteral(resourceName: "image17"), profilePostSecondImage: #imageLiteral(resourceName: "image16"), profilePostThirdImage: nil)]
    
    // MARK: - Get users func
    
    func getUsers(completion: @escaping(([User]) -> Void)) {
        completion([.init(profileImageView: #imageLiteral(resourceName: "profileImage"), profileStatus: "Flame \nUTOPIA \nCactus Jack Rerords", profileNickName: "travisscott", profilePassword: "admin1", profileEmail: "ts@yahoo.com", userPosts: firstUserNewsFieldPosts, profileSubscribersCount: "43,5 млн", profileSubscriptionsCount: "81", profilePublicationsCount: "3 138", profilePosts: firstProfilePosts), .init(profileImageView: #imageLiteral(resourceName: "image10"), profileStatus: "Rich MF \nPUNK", profileNickName: "thuggerthugger1", profilePassword: "admin1", profileEmail: "yt@yandex.ru", userPosts: secondUserNewsFieldPosts, profileSubscribersCount: "8,9 млн", profileSubscriptionsCount: "1", profilePublicationsCount: "15", profilePosts: secondProfilePosts), .init(profileImageView: #imageLiteral(resourceName: "profileImage3"), profileStatus: "The big4l \nSAVAGE MODE2", profileNickName: "21savage", profilePassword: "admin1", profileEmail: "21s@mail.ru", userPosts: thirdUserNewsFieldPosts, profileSubscribersCount: "12,7 млн", profileSubscriptionsCount: "492", profilePublicationsCount: "1 285", profilePosts: thirdProfilePosts)])
    }
}
