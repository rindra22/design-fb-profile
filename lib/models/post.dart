import 'package:amelioration_page_facebook/models/profil.dart';

class Posts extends Profil {
  String? _time;
  bool _isLiked = false;
  String _textIsLiked = "J'aime";
  int? _id;

  /* Posts({String? couverture, String? name, String? photo, String? time, String? description, }) : 
    super(couverture: couverture,name: name, photo: photo, description: description){
    _time = time;
  } */

  Posts(
      {
      int? id,
      String? couverture,
      String? name,
      String? photo,
      String? time,
      String? description,
      bool? isLiked,
      String? textIsLiked})
      : super(
            couverture: couverture,
            name: name,
            photo: photo,
            description: description) {
    
    _id = id;
    _time = time;
    _isLiked = isLiked!;
    _textIsLiked = textIsLiked!;
  }

  static List<Posts> getPosts() {
    return <Posts>[
      Posts(
        id: 1,
        name: 'Rindra Rasolonirina',
        photo: 'assets/images/profil/profil.jpg',
        time: 'Il y a 5 min',
        description:
            'Quel sera la prochaine destination après les 8000km validé ?',
        couverture: 'assets/images/posts/post2.jpg',
        isLiked: true,
        textIsLiked: "J'aime",
      ),
      Posts(
        id: 2,
        name: 'Rindra Rasolonirina',
        photo: 'assets/images/profil/profil.jpg',
        time: 'Il y a 13 min',
        description: '🤔🤔🤔',
        couverture: 'assets/images/posts/post3.jpg',
        isLiked: true,
        textIsLiked: "J'aime",
      ),
      Posts(
        id: 3,
        name: 'Rindra Rasolonirina',
        photo: 'assets/images/profil/profil.jpg',
        time: 'Il y a  1 jour',
        description:
            'ChatGPT-4 latest version is 50 times \nsmarter than old and unpublished \n version',
        couverture: 'assets/images/posts/post4.jpg',
        isLiked: true,
        textIsLiked: "J'aime",
      ),
      Posts(
        id: 4,
        name: 'Rindra Rasolonirina',
        photo: 'assets/images/profil/profil.jpg',
        time: 'Il y a  2 jour',
        description: 'Setup tour (Workspace) 🤩🤩🤩',
        couverture: 'assets/images/posts/post6.jpg',
        isLiked: true,
        textIsLiked: "J'aime",
      )
    ];
  }

  int? get id => _id;

  set id(int? value) {
    _id = value;
  }

  String? get time => _time;

  set time(String? value) {
    _time = value;
  }

  String? get textIsLike => _textIsLiked;

  set textIsLike(String? value) {
    _textIsLiked = value!;
  }

  bool get isLike => _isLiked;

  set isLike(bool value) {
    _isLiked = value;
  }

  bool toggleIsLike() {
    _isLiked = !_isLiked;

    if (_isLiked) {
      _textIsLiked = "Je n'aime plus";
    } else {
      _textIsLiked = "J'aime";
    }
    return _isLiked;
  }
}
