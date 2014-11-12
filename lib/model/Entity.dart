library model.Entity;

class Entity {
  String _name;
  String _race;
  String _type; // eg. Humanoid, Abberation, Construct etc.
  String _alignment;
  int _size;
  int _level;
  int _hitDie;
  int _maxHitPoints;
  int _currentHitPoints;
  int _armorClass;
  int _proficiency;
  int _movement;
  String _status;
  
  int _strength;
  int _dexterity;
  int _constitution;
  int _intelligence;
  int _wisdom;
  int _charisma;
  
  List<Map> skillsList = [ // Str 0, Dex 1, Int 2, Wis 3, Cha 4
    { // Strength
      "athletics": 0
      },
    { // Dexterity
      "acrobatics": 0,
      "sleight of hand": 0,     
      "stealth": 0
      },
    { // Intelligence
      "arcana": 0,
      "history": 0,
      "investigation": 0,
      "nature": 0,
      "religion": 0
      },
    { // Wisdom
        "animal handling": 0,
        "insight": 0,
        "medicine": 0,
        "perception": 0,
        "survival": 0        
      },
    { // Charisma
        "deception": 0,
        "intimidation": 0,
        "performance": 0,
        "persuasion": 0       
      }
      
  ];
  
  void calcSkills(int abilityScore) {
    
  }
  
  Map<String, int> skills = {
     // Strength
     "athletics": 0,
     // Dexterity
     "acrobatics": 0,
     "sleight of hand": 0,     
     "stealth": 0,
     // Intelligence
     "arcana": 0,
     "history": 0,
     "investigation": 0,
     "nature": 0,
     "religion": 0,
     // Wisdom
     "animal handling": 0,
     "insight": 0,
     "medicine": 0,
     "perception": 0,
     "survival": 0,
     // Charisma
     "deception": 0,
     "intimidation": 0,
     "performance": 0,
     "persuasion": 0
  };
  
  Entity(this._name, this._maxHitPoints) {
    _currentHitPoints = _maxHitPoints;
    _status = "normal";
  }
  
  double calculateSave(int abilityScore) {
    return (abilityScore/2 - 5);
  }
  
  void takeDamage(int dmg) {
    _currentHitPoints -= dmg;
  }
  
  void heal(int healing) {
    if (_currentHitPoints == _maxHitPoints) {
      // Nothing
    }
    else {
      _currentHitPoints += healing;
      if (_currentHitPoints > _maxHitPoints) {
        _currentHitPoints = _maxHitPoints;
      } 
    }       
  }
  
  void changeStatus(String newStatus) {
    _status = newStatus;
  }
  
  
  
}