life = Post.create(title: 'My awesome life....', blog: 'Read about my awesome life.')
amazon = Post.create(title: 'Advenure to the Amazon', blog: 'Pictures and stuff of the Amazon')
texas = Post.create(title: 'Big things I did in Texas', blog: 'Giant things I ate in Texas')



food = Tag.create(tag_name: 'food')
pictures = Tag.create(tag_name: 'pictures')
brian = Tag.create(tag_name: 'Brian')

brian.posts << life
brian.posts << amazon
pictures.posts << texas
pictures.posts << amazon
food.posts << amazon