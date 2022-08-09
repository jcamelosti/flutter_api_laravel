class ArticleInfo {
  late int? id;
  late String article_content;
  late String title;
  late String description;
  late String created_at;
  late String img;
  //late String author;

  ArticleInfo(this.id, this.article_content, this.title,
      this.description, this.created_at, this.img);

  /*ArticleInfo.fromJson(Map json)
      : id = json['id'],
        author = json['author'],
        article_content = json['article_content'],
        description = json['description'],
        title = json['title'],
        created_at = json['created_at'],
        img = json['img'];*/

  factory ArticleInfo.fromJson(Map<String, dynamic> json){
    return ArticleInfo(
        json['id'],
        json['article_content'],
        json['description'],
        json['title'],
        json['created_at'],
        json['img'],
        //json['author'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'article_content': article_content,
      'title': title,
      'description': description,
      'created_at': created_at,
      'img': img,
      //'author': author,
    };
  }
}
