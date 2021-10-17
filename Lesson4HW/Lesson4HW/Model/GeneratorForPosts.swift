//
//  GeneratorForPosts.swift
//  Lesson4HW
//
//  Created by Тимур Миргалиев on 12.10.2021.
//

import Foundation
import UIKit

class GeneratorForPosts {
    
    var arrayOfNames: [String] = []
    var arrayOfImages: [String] = []
    var flag: Int = 0
    
    var fotoes: [String] = ["1", "2", "3", "4", "5", "6", "7", "8"]
    let textsInPosts: [String] = ["Дороги в Эквадоре практически идеальные, хотя населенные пункты выглядят очень бедно. На дорогах много интересных машин, например очень много грузовиков - древних Фордов, которые я никогда раньше не видел. А еще несколько раз на глаза попадались старенькие Жигули :) А еще если кого-то обгоняешь и есть встречная машина, она обязательно включает фары. На больших машинах - грузовиках и автобусах, обязательно красуется местный тюнинг: машины разукрашенные, либо в наклейках, и обязательно везде огромное множество светодиодов, как будто новогодние елки едут и переливаются всеми цветами.", "Во все большем количестве российских изданий − как печатных, так и онлайновых − появляются объемные материалы особого типа, за которыми в журналистской среде закрепилось название «длинные тексты» (англ. – long forms) или лонгриды (от англ. − long read – материал, предназначенный для длительного прочтения, в отличие от маленькой заметки).Сразу же следует оговориться, что объем материала – хотя и наиболее заметная, но не ключевая характеристика лонгрида. Объемными могут быть и материалы других жанров, поэтому сам по себе большой объем текста вовсе не означает, что перед нами лонгрид. Как будет показано в исследовании, лонгриды отличает также особый подход к выбору темы, требования к качеству собранной информации и способ подачи материала.В исследовании предпринята попытка описать типологические характеристики лонгридов, разобрать особенности их подготовки, а также выявить распространенность лонгридов в современной российской прессе. Еще одной целью исследования является оценка перспектив этого жанра, о котором можно говорить если не как о сложившемся (в принятых на сегодняшний день в научной среде жанровых классификациях лонгрид отсутствует), то как о складывающемся и проникающем во все большее количество изданий.", "Хотя лонгрид как жанр еще только складывается, многие аспекты работы над материалами данного типа разобраны как в российской, так и в зарубежной учебно-методической литературе. Например, М. Григорян выделяет в качестве отдельного жанра «длинные статьи» объемом в 800−2000 слов. Темой для таких материалов может стать «анализ ситуации, рассказ о необычном человеке и повествование о том, как живут люди в странных местах». При подготовке материала М. Григорян рекомендует использовать композиционную схему «зигзаг», чередуя примеры и репортажные фрагменты («краски») с информационными вставками («факты»). Начинать текст следует с человеческой истории, отражающей проблему, завершать материал – другой историей, которая «оставила бы у читателя запоминающийся образ»", "Long texts (longreads), where big size combines with in-depth reporting, are becoming increasingly popular in print and online media, because these texts enable the publication to stand out against the information noise. The aims of this research are to identify the popularity of longreads in the Russian media and their content and compositional particularities. The research includes the monitoring of Russian federal publications and subsequent content analysis of 10 articles issued in 10 print and online publications. The key findings of the research indicate that longreads can be found in publications of different types from daily newspapers to niche news sites. As a rule, the texts are devoted to a description of a new phenomenon, their normal size being 2−4 thousand words. The usual longread composition scheme is an alternation of examples and generalizations.", " "]
    var namesInPost: [String] = ["Крюков Эмин Савельевич", "Гурова Виктория Марковна", "Леонтьев Алексей Матвеевич", "Никифоров Иван Матвеевич", "Яковлев Артём Ибрагимович", "Савельев Ярослав Алексеевич", "Яковлева Вера Васильевна", "Иванова Анастасия Филипповна", "Титова Дарья Артёмовна", "Марков Александр Михайлович"]
    let dateInPost: [String] = ["23.08.2021", "20.09.2021", "29.09.2021", "08.10.2021", "11.10.2021", "15.10.2021", "19.10.2021", "21.10.2021", "08.11.2021", "17.11.2021"]
    
    /// This method append to array of names person which log in
    func setNamePersonWichLogIn() {
        namesInPost.append(ViewController.personHowLogIn[0].name)
    }
    
    func generateTabel(fotoInTable: String?, textInTable: String?, nameInTable: String?, imageInTable: String?, dataInPost: String?) -> Post{
        return bookAvatar(post: Post.init(
            foto: fotoInTable,
            textInPost: textInTable,
            nameOfPost: nameInTable,
            image: imageInTable,
            dateOfPost: dataInPost))
        
    }
    
    /// This method generate default post
    func generate() -> Post{
        return generateTabel(fotoInTable: fotoes.randomElement(),
                             textInTable: textsInPosts.randomElement(),
                             nameInTable: namesInPost.randomElement(),
                             imageInTable: fotoes.randomElement(),
                             dataInPost: dateInPost.randomElement())
    }
    
    /// This method create default post  to person wich log in
    func generateForPersonFirst() -> Post {
        return generateTabel(fotoInTable: fotoes.randomElement(),
                             textInTable: textsInPosts.randomElement(),
                             nameInTable: ViewController.personHowLogIn[0].name, imageInTable: fotoes.randomElement(),
                             dataInPost: dateInPost.randomElement())
        
    }
    
    /// This method create post without image to person wich log in
    func generateForPersonSecond() -> Post {
        return generateTabel(fotoInTable: fotoes.randomElement(),
                             textInTable: textsInPosts.randomElement(),
                             nameInTable: ViewController.personHowLogIn[0].name,
                             imageInTable: " ",
                             dataInPost: dateInPost.randomElement())
    }
    
    /// This method create  post  without text to person wich log in
    func generateForPersonThird() -> Post {
        return generateTabel(fotoInTable: fotoes.randomElement(),
                             textInTable: " ",
                             nameInTable: ViewController.personHowLogIn[0].name, imageInTable: fotoes.randomElement(), dataInPost: dateInPost.randomElement())
    }
    
    /// This method book one avatar to every persons
    func bookAvatar(post: Post) -> Post {
        if arrayOfNames.contains(post.name!) {
        } else {
            arrayOfNames.append(post.name!)
            arrayOfImages.append(post.avatar!)
            post.avatar = arrayOfImages[0]
        }
        for i in 1..<arrayOfNames.count {
            flag = checking(array: arrayOfNames, name: post.name!)
            if  flag != -1 {
                post.avatar = arrayOfImages[flag]
            } else {
                arrayOfNames.append(post.name!)
                arrayOfImages.append(post.avatar!)
                post.avatar = arrayOfImages[i]
            }
        }
        return post
    }
    
    ///  This method say on which place we keep image to some person
    func checking (array: [String], name: String) -> Int {
        for i in 0..<array.count {
            if array[i] == name {
                return i
            }
        }
        return -1
    }
    
}
