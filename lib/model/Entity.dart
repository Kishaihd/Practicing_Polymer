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
  
  bool statsCalculated = false;
  
  // Skill lists (as maps)
  Map<String, int> strSkills = {
    "athletics": 0
  };
  
  Map<String, int> dexSkills = {
      "acrobatics": 0,
      "sleight of hand": 0,     
      "stealth": 0
  };

  Map<String, int> intSkills = {
    "arcana": 0,
    "history": 0,
    "investigation": 0,
    "nature": 0,
    "religion": 0      
  };

  Map<String, int> wisSkills = {
    "animal handling": 0,
    "insight": 0,
    "medicine": 0,
    "perception": 0,
    "survival": 0
  };
  
  Map<String, int> chaSkills = {
    "deception": 0,
    "intimidation": 0,
    "performance": 0,
    "persuasion": 0
  };
  
  List<Map> skillList = [];
  
  // Does not include Constitution.
  List<int> abilitiesForSkills = [];
  
  
//  List<Map> skillsList = [ // Str 0, Dex 1, Int 2, Wis 3, Cha 4
//    { // Strength
//      "athletics": 0
//      },
//    { // Dexterity
//      "acrobatics": 0,
//      "sleight of hand": 0,     
//      "stealth": 0
//      },
//    { // Intelligence
//      "arcana": 0,
//      "history": 0,
//      "investigation": 0,
//      "nature": 0,
//      "religion": 0
//      },
//    { // Wisdom
//        "animal handling": 0,
//        "insight": 0,
//        "medicine": 0,
//        "perception": 0,
//        "survival": 0        
//      },
//    { // Charisma
//        "deception": 0,
//        "intimidation": 0,
//        "performance": 0,
//        "persuasion": 0       
//      }
//      
//  ];
  
  
//  Map<String, int> skills = {
//     // Strength
//     "athletics": 0,
//     // Dexterity
//     "acrobatics": 0,
//     "sleight of hand": 0,     
//     "stealth": 0,
//     // Intelligence
//     "arcana": 0,
//     "history": 0,
//     "investigation": 0,
//     "nature": 0,
//     "religion": 0,
//     // Wisdom
//     "animal handling": 0,
//     "insight": 0,
//     "medicine": 0,
//     "perception": 0,
//     "survival": 0,
//     // Charisma
//     "deception": 0,
//     "intimidation": 0,
//     "performance": 0,
//     "persuasion": 0
//  };
  
  Entity(this._name, this._maxHitPoints, this._strength, this._dexterity, this._constitution, this._intelligence, this._wisdom, this._charisma) {
    _currentHitPoints = _maxHitPoints;
    _status = "normal";
    skillList = [strSkills, dexSkills, intSkills, wisSkills, chaSkills];
    abilitiesForSkills = [_strength, _dexterity, _intelligence, _wisdom, _charisma];
  }
  
  int calculateSave(int abilityScore) {
    return (abilityScore/2 - 5).floor();
  }
  
  // Run after race (and class?) is/are selected.
  void skillsPlusAbilities() {
    for (int i = 0; i < skillList.length; i++) {
      for (int value in skillList) {
        value += abilitiesForSkills[i];
      }
    }
  }

  // Runs a few smaller functions to calculate final skill score?
  void calcSkills(int abilityScore) {
    
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





// Shit for practicing shit
import 'dart:io';

void main() {

int _strength;
int _dexterity;
int _constitution;
int _intelligence;
int _wisdom;
int _charisma; 

print("Input strength");
_strength = int.parse(stdin.readLineSync());

print("Input dexterity");
_dexterity = int.parse(stdin.readLineSync());

print("Input con");
_constitution = int.parse(stdin.readLineSync());

print("Input intelligence");
_intelligence = int.parse(stdin.readLineSync());

print("Input wisdom");
_wisdom = int.parse(stdin.readLineSync());

print("Input charisma");
_charisma = int.parse(stdin.readLineSync());

Map<String, int> abilities = { // Write getters for all these and use them instead of the raw private int.
"Strength": _strength,
"Dexterity": _dexterity,
"Constitution": _constitution, 
"Intelligence": _intelligence,
"Wisdom": _wisdom,
"Charisma": _charisma
};

// Skill lists (as maps)
Map<String, int> strSkills = {
"athletics": 0
};

Map<String, int> dexSkills = {
"acrobatics": 0,
"sleight of hand": 0,     
"stealth": 0
};

Map<String, int> intSkills = {
"arcana": 0,
"history": 0,
"investigation": 0,
"nature": 0,
"religion": 0      
};

Map<String, int> wisSkills = {
"animal handling": 0,
"insight": 0,
"medicine": 0,
"perception": 0,
"survival": 0
};

Map<String, int> chaSkills = {
"deception": 0,
"intimidation": 0,
"performance": 0,
"persuasion": 0
};

List<Map> skillList = [];

// Does not include Constitution.
List<int> abilitiesForSkills = [];

skillList = [strSkills, dexSkills, intSkills, wisSkills, chaSkills];
abilitiesForSkills = [_strength, _dexterity, _intelligence, _wisdom, _charisma];


int calcAbilityMod(int abilityScore) {
return (abilityScore/2 - 5).floor();
}

// Run after race (and class?) is/are selected.
void skillsPlusAbilities() {
List newSkillList = new List.from(skillList);
 
for (int i = 0; i < abilitiesForSkills.length; i++) {
 for (int j = 0; j < skillList[i].length; j++) {
   skillList[i].forEach((String k, int value) {
     newSkillList[i][k][value] = skillList[i][k][value + calcAbilityMod(abilitiesForSkills[i])];        
//        int score = value;
//        score += calcAbilityMod(abilitiesForSkills[i]);
//        value = score;
   });
 }
}
skillList = newSkillList;
newSkillList.clear();
}

String printSkills() {
print(skillList.toString());
return skillList.toString();
}

String printAbilitiesAndMods() {
abilities.forEach((String k, int v) => print("$k : $v Modifier: ${calcAbilityMod(v)} \n"));
String msg = "${abilities.forEach((String k, int v) => "$k : $v \n")}";
return msg;
}


skillsPlusAbilities();

printAbilitiesAndMods();
printSkills();  


}

