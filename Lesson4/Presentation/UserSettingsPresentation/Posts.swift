//
//  Posts.swift
//  Lesson4
//
//  Created by Илья on 21.10.2021.
//

import UIKit

//MARK - Массивы постов для отдельных юзеров
var posts: [Post] =
    [ Post(username:"davidjohnson", description:"hello all, that's my first post here, \nLook at this photo!", picture: UIImage(named:"photo3") ?? UIImage(), profile_picture: UIImage(named:"photo3"), status: "photographer"),
      Post(username:"bestest1", description:"ur favorite playlist, \nwhich you never listened to", picture: nil, profile_picture: UIImage(named:"photo3"), status: "playlist maker"),
      Post(username:"voxsie", description:"I am not mad, I am not mad, \nI am not mad, I am not mad, \nI am not mad, I am not mad, \nI am not mad, I am not mad, \nI am not mad, I am not mad, \nI am not mad, I am not mad, \nI am not mad, I am not mad, \nI am not mad", picture: UIImage(named: "somephotos1") ?? UIImage(), profile_picture: UIImage(named:"photo3"), status: "creator"),
      Post(username:"i.zheltikov", description:"needs \nno \nexplanation", picture: UIImage(named: "somephotos2") ?? UIImage(), profile_picture: UIImage(named:"somephotos2"), status: "student"),
      Post(username:"emiljan", description: "good morning all! That's really good start of day! I enjoyed it. I wish you to feel the same. Unforgetable for me....", picture: UIImage(named: "somephotos3"), profile_picture: UIImage(named:"somephotos3"), status: "influencer"),
      Post(username:"vxsvxsvxs", description:"is this the moment I've been waiting for? Hurrah! Nope.", picture: nil, profile_picture: UIImage(named:"somephotos1"), status: "writer"),
      Post(username:"globalball", description:"What's your choise: \n :) or (: ???", picture: nil, profile_picture: UIImage(named: "person.circle.icon"), status: "popular person"),
      Post(username:"firstmanhere", description:"but I like this social network more than twitter....", picture: nil, profile_picture: UIImage(named: "person.circle.icon"), status: "ex twitter user"),
      Post(username:"firstmanhere", description:"opps, it isn't", picture: nil, profile_picture: UIImage(named: "person.circle.icon"), status: "ex twitter user"),
      Post(username:"firstmanhere", description:"is the twitter?", picture: nil, profile_picture: UIImage(named: "person.circle.icon"), status: "ex twitter user")]

var posts1: [Post] =
    [ Post(username:"davidjohnson", description:"hello all, that's my first post here, \nLook at this photo!", picture: UIImage(named:"photo3") ?? UIImage(), profile_picture: UIImage(named:"photo3"), status: "photographer"),
      Post(username:"bestest1", description:"ur favorite playlist, \nwhich you never listened to", picture: nil, profile_picture: UIImage(named:"photo3"), status: "playlist maker"),
      Post(username:"voxsie", description:"I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad", picture: UIImage(named: "somephotos1") ?? UIImage(), profile_picture: UIImage(named:"photo3"), status: "creator"),
      Post(username:"i.zheltikov", description:"needs \nno \nexplanation", picture: UIImage(named: "somephotos2") ?? UIImage(), profile_picture: UIImage(named:"somephotos2"), status: "student"),
      Post(username:"emiljan", description: "good morning all! That's really good start of day! I enjoyed it. I wish you to feel the same. Unforgetable for me....", picture: UIImage(named: "somephotos3"), profile_picture: UIImage(named:"somephotos3"), status: "influencer"),
      Post(username:"vxsvxsvxs", description:"is this the moment I've been waiting for? Hurrah! Nope.", picture: nil, profile_picture: UIImage(named:"somephotos1"), status: "writer"),
      Post(username:"globalball", description:"What's your choise: \n :) or (: ???", picture: nil, profile_picture: UIImage(named: "person.circle.icon"), status: "popular person"),
      Post(username:"firstmanhere", description:"but I like this social network more than twitter....", picture: nil, profile_picture: UIImage(named: "person.circle.icon"), status: "ex twitter user"),
      Post(username:"firstmanhere", description:"opps, it isn't", picture: nil, profile_picture: UIImage(named: "person.circle.icon"), status: "ex twitter user"),
      Post(username:"firstmanhere", description:"is the twitter?", picture: nil, profile_picture: UIImage(named: "person.circle.icon"), status: "ex twitter user")]

var posts2: [Post] =
    [ Post(username:"jackrassel", description:"-How are you? \n-It could be better", picture: UIImage(named:"person.circle.icon") ?? UIImage(), profile_picture: UIImage(named:"photo3"), status: "photographer"),
      Post(username:"bestest2", description:"Nice to meet you :)", picture: nil, profile_picture: UIImage(named:"person.circle.icon"), status: "playlist maker"),
      Post(username:"voxsie", description:"GOD DAMN, I WON THIS LIFE", picture: UIImage(named: "somephotos1") ?? UIImage(), profile_picture: UIImage(named:"photo3"), status: "creator"),
      Post(username:"i.zheltikov", description:"needs \nno \nexplanation", picture: UIImage(named: "somephotos2") ?? UIImage(), profile_picture: UIImage(named:"somephotos2"), status: "student"),
      Post(username:"emiljan", description: "good morning all! That's really good start of day! I enjoyed it. I wish you to feel the same. Unforgetable for me....", picture: UIImage(named: "somephotos3"), profile_picture: UIImage(named:"somephotos3"), status: "influencer"),
      Post(username:"zxcplayer", description:"Who want to play with me?(", picture: nil, profile_picture: UIImage(named:"somephotos1"), status: "writer"),
      Post(username:"boomboom", description:"What's your choise: \n :) or (: ???", picture: nil, profile_picture: UIImage(named: "person.circle.icon"), status: "popular person"),
      Post(username:"hahalike", description:"I like this social network more than twitter....", picture: nil, profile_picture: UIImage(named: "person.circle.icon"), status: "ex twitter user"),
      Post(username:"hahalike", description:"i love this social network too much", picture: nil, profile_picture: UIImage(named: "person.circle.icon"), status: "ex twitter user"),
      Post(username:"hahalike", description:"hello everybody!", picture: nil, profile_picture: UIImage(named: "person.circle.icon"), status: "ex twitter user")]
