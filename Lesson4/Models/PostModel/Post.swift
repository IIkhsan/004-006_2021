struct Post {
    // Property
    let avatar: String
    let nickname: String
    let text: String
    let image: String
}

func createPost() -> Post {
    guard var randomImage = photos.randomElement(),
          var randomAvatar = photos.randomElement(),
          let randomNickname = authors.randomElement(),
          let randomText = posts.randomElement() else { return Post(avatar: "", nickname: "", text: "", image: "") }
    
    while randomAvatar == "" {
        guard let anotherAvatar = photos.randomElement() else { return Post(avatar: "", nickname: "", text: "", image: "") }
        randomAvatar = anotherAvatar
    }
    
    while randomText == "", randomImage == "" {
        guard let anotherRandomImage = photos.randomElement() else { return Post(avatar: "", nickname: "", text: "", image: "") }
        randomImage = anotherRandomImage
    }
    
    return Post(avatar: randomAvatar, nickname: randomNickname, text: randomText, image: randomImage)
}
