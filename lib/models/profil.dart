class Profil{
  
  String? _couverture;
  String? _photo;
  String? _name;
  String? description;
  List <String>? _metiers;


  Profil({String? couverture, String? photo, String? name, String? description, List<String>? metiers}){
    this._couverture = couverture;
    this._photo = photo;
    this._name = name;
    this.description = description;
    this._metiers = metiers;
  }

  String? get couverture => _couverture;

  set couverture(String? value) {
    _couverture = value;
  }

  String? get photo => _photo;

  set photo(String? value) {
    _photo = value;
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  List<String>? get metiers => _metiers;

  set metiers(List<String>? value) {
    _metiers = value;
  }

}