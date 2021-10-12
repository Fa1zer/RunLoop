//
//  ProfilePosts.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 11.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

struct ProfilePost {
    var autor: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

let posts: [ProfilePost] = [ProfilePost(autor: "apple",
                                          description: "AirTag — это суперлёгкий способ находить свои вещи. Прикрепите один трекер AirTag к ключам, а другой — к рюкзаку. И теперь их видно на карте в приложении «Локатор». Там же можно посмотреть, где находятся ваши устройства Apple, а также ваши друзья и семья.",
                                          image: "airtag", likes: 8484, views: 9009),
                                    
                                    ProfilePost(autor: "apple.russia",
                                          description: "Процессор A14 Bionic далеко впереди других процессоров iPhone. Система камер Pro гораздо лучше работает при слабом освещении — а на iPhone 12 Pro Max ещё лучше. Ceramic Shield в четыре раза снижает риск повреждений дисплея при падении. Давайте посмотрим, как тут всё устроено.",
                                          image: "iphone 12 pro max", likes: 7585, views: 9569),
                            
                                    ProfilePost(autor: "samsung",
                                          description: "Представляем новый Galaxy S21 Ultra 5G. Его камеры — это киностудия у вас в руках. С ее помощью вы сможете снимать видео 8К и превращать каждый его кадр в яркий снимок — просто «на ходу». А сочетание сверхбыстрого 5-нм процессора Exynos, прочного стеклянного корпуса и аккумулятора на целый день работы полностью оправдывает его название — Ultra.",
                                          image: "samsung", likes: 1344, views: 5453),
                            
                                    ProfilePost(autor: "samsung.russia",
                                          description: "Квантовый прорыв в мире изображения",
                                          image: "neo qled", likes: 4045, views: 5595)]
