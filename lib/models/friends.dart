import 'package:amelioration_page_facebook/models/profil.dart';

class Friends extends Profil{
  Friends({String? name, String? photo, String? description, List<String>? metiers, String? couverture}) : super(name: name, photo: photo, description: description, metiers: metiers,couverture: couverture);
  
  static List<Friends> getFriends(){
    
    return <Friends>[
      Friends(name: 'Stéphan J. Christian', photo: 'assets/images/profil/stephan.jpg',description: "💻 Software Engineer\n📱Mobile Application Specialist\n💪🏼Fitness Fanatic", metiers: ["Co-Founder/Training Manager,à Digital Training Center","Software Development Engineer,à Bocasay"],couverture: "assets/images/cover/stephan.jpg"),
      Friends(name: 'Eric Ralainoro', photo: 'assets/images/profil/eric.jpg',description: "Bonjour, je suis Eric Ralainoro", metiers: ["Business Analyst, à MANAO"],couverture: "assets/images/cover/eric.jpg"),
      Friends(name: 'Julien Rajerison', photo: 'assets/images/profil/julien.jpg',description: "Tsy mandray compte fako satria tsy poubelle. Merci !", metiers: ["Responsable formation, à Digital Training Center", "Team Leader,à Bocassay"], couverture: "assets/images/cover/jul.jpg"),
      Friends(name: 'Kajy Iharena', photo: 'assets/images/profil/jim.jpg',description: "Dream big,stay positive,work hard and enjoy the journey", metiers: ["Développeur web, à GeniusAtWork"],couverture: "assets/images/cover/jim.jpg"),
      Friends(name: 'Ro berto', photo: 'assets/images/profil/jude.jpg',description: "Bonjour, je suis Ro berto", metiers: ["Développeur web, à ETech"],couverture: "assets/images/cover/jude.jpg"),
    ];

  }
}