import 'package:articles/src/features/articles_main/articles_main/domain/entities/article_model.dart';

Map<String, dynamic> articleMap = {
  "uri": "nyt://article/85c60688-5a6a-58fe-a055-eb4865819355",
  "url":
      "https://www.nytimes.com/2023/05/02/nyregion/trump-carroll-rape-lawsuit.html",
  "id": 100000008883907,
  "asset_id": 100000008883907,
  "source": "New York Times",
  "published_date": "2023-05-02",
  "updated": "2023-05-03 12:29:27",
  "section": "New York",
  "subsection": "",
  "nytdsection": "new york",
  "adx_keywords":
      "Suits and Litigation (Civil);Sex Crimes;Libel and Slander;Carroll, E Jean;Birnbach, Lisa;Trump, Donald J",
  "column": null,
  "byline": "By Kate Christobek, Benjamin Weiser and Lola Fadulu",
  "type": "Article",
  "title":
      "Carroll’s Friend Tells of a Fraught Call Reporting an Attack by Trump",
  "abstract":
      "E. Jean Carroll, who has accused the former president of raping her, has finished her cross-examination. On Tuesday, her lawyers called witnesses to bolster her case.",
  "des_facet": [
    "Suits and Litigation (Civil)",
    "Sex Crimes",
    "Libel and Slander"
  ],
  "org_facet": [],
  "per_facet": ["Carroll, E Jean", "Birnbach, Lisa", "Trump, Donald J"],
  "geo_facet": [],
  "media": [
    {
      "type": "image",
      "subtype": "photo",
      "caption":
          "Lisa Birnbach testified she had to whisper on the telephone to keep her children from hearing. ",
      "copyright": "Anna Watts for The New York Times",
      "approved_for_syndication": 1,
      "media-metadata": [
        {
          "url":
              "https://static01.nyt.com/images/2023/05/02/multimedia/02trump-carroll-pgkq/02trump-carroll-pgkq-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75
        },
        {
          "url":
              "https://static01.nyt.com/images/2023/05/02/multimedia/02trump-carroll-pgkq/02trump-carroll-pgkq-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210
        },
        {
          "url":
              "https://static01.nyt.com/images/2023/05/02/multimedia/02trump-carroll-pgkq/02trump-carroll-pgkq-mediumThreeByTwo440.jpg",
          "format": "mediumThreeByTwo440",
          "height": 293,
          "width": 440
        }
      ]
    }
  ],
  "eta_id": 0
};
Map dataResponseArticles = {
  "status": "OK",
  "copyright":
      "Copyright (c) 2023 The New York Times Company.  All Rights Reserved.",
  "num_results": 20,
  "results": [articleMap]
};

ArticleModel articleModelTest = ArticleModel.fromJson(articleMap);
List<ArticleModel> listResponseTest = [articleModelTest];
