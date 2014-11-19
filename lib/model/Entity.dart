library model.Entity;

import 'dart:io';

class Entity {
  String _name;
  String _race;
  String _type; // eg. Humanoid, Abberation, Construct etc.
  String _alignment;
  String _size;
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
  
//  Entity();
  
  // Parameterized constructor.
  // Name, maxHP, ability scores.
  Entity(this._name, this._maxHitPoints, this._strength, this._dexterity, this._constitution, this._intelligence, this._wisdom, this._charisma) {
    _currentHitPoints = _maxHitPoints;
    _status = "normal";
    final skillList = [strSkills, dexSkills, intSkills, wisSkills, chaSkills];
    refactor();
  }
  
  void refactor() {
    abilitiesForSkills = [_strength, _dexterity, _intelligence, _wisdom, _charisma];
        
  }
  
  int calcAbilityMod(int abilityScore) {
    return (abilityScore/2 - 5).floor();
  }
  
  // Run after race (and class?) is/are selected.
  void skillsPlusAbilities() {    
    List<Map> newSkillList = [];
    for (int i = 0; i < abilitiesForSkills.length; i++) {     
      skillList[i].forEach((String skillName,int skillRank) { 
        skillList[i][skillName] = skillRank + calcAbilityMod(abilitiesForSkills[i]);
            }); 
    }
  } 

  // Adds racial bonuses to abilities and skills?
  void addRace() {
    switch (_race) {
      case 'human':
        allAbilities.forEach((String ability, int value) {
          allAbilities[ability] = value + 1;
      });
        
        break;
      case 'elf':
        
        break;
      default:
        
    }
    
    
  }
  
  void chooseStatIncrease() {
    print("This function is only for the command line version of this app!\n"
          "Choose a stat to increase, nigga! (s)tr, (d)ex, (c)on, (i)nt, (w)is, (c)ha.");
    String answer = stdin.readLineSync();
    switch(answer) {
      case 's':
          
      case 'd':
        
      case 'c':
        
      case 'i':
        
      case 'w':
        
      case 'c':
        
        break;
    }
  }
  
  void increaseStat(String stat, int bonus) {
    stat = stat.toLowerCase();
        int thisSkill; 
        bool foundSkill;
        int skillIdx = 0;
        do {
          if (skillIdx >= skillList.length) {
            break;
          }
          foundSkill = (skillList[skillIdx].containsKey(stat));
          thisSkill = skillList[skillIdx][stat];
          skillIdx++;
        } while (foundSkill == false);
      
        if (foundSkill == false) {
          print("Skill not found!");
        }
        else {
          skillIdx--;
          skillList[skillIdx][stat] += bonus;
        }
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
  // Throw in some if (_status == _____) 
    // statements to add mechanics and maybe flavor text.
    
  }
  
  // Getters
  int get strength => _strength;
  int get dexterity => _dexterity;
  int get constitution => _constitution;
  int get intelligence => _intelligence;
  int get wisdom => _wisdom;
  int get charisma => _charisma;
  int get currentHP => _currentHitPoints;
  int get level => _level;
  int get HD => _hitDie;
  int get maxHP => _maxHitPoints;
  int get AC => _armorClass;
  int get proficiencyBonus => _proficiency;
  int get movement => _movement;
  String get name => _name;
  String get size => _size;
  String get race => _race;
  String get type => _type == null? "humanoid" : _type; // eg. Humanoid, Abberation, Construct etc.
  String get allignment => _alignment;
  String get status => _status;
      
  // "Generic" getter that returns any single skill and value.
  int getSkill(String skillName) {
    skillName = skillName.toLowerCase();
    int thisSkill; 
    bool foundSkill;
    int skillIdx = 0;
    do {
      if (skillIdx >= skillList.length) {
        break;
      }
      foundSkill = (skillList[skillIdx].containsKey(skillName));
      thisSkill = skillList[skillIdx][skillName];
      skillIdx++;
    } while (foundSkill == false);
  
    if (foundSkill == false) {
      print("Skill not found!");
      return 0;
    }
    else {
      print("$skillName: $thisSkill");        
      return thisSkill;
    }      
  }
  
  // Setters
  void set strength(int str) { _strength = str;}
  void set dexterity(int dex) {_dexterity = dex;}
  void set constitution(int con) { _constitution = con;}
  void set intelligence(int intl) { _intelligence = intl;}
  void set wisdom(int wis) { _wisdom = wis;}
  void set charisma(int cha) { _charisma = cha;}
  void set currentHP(int hp) { _currentHitPoints = hp;}
  void set size(String size) { _size = size;}
  void set level(int lvl) { _level = lvl;}
  void set HD(int hd) { _hitDie = hd;}
  void set maxHP(int hpMax) {_maxHitPoints = hpMax;}
  //void set AC(int ac) { _armorClass = ac;} // Calculated automatically.
  //void set proficiencyBonus(int prof) { _proficiency = prof;}
  //void set movement => _movement
  void set name(String name) { _name = name;}
  void set race(String race) { _race = race;}
  void set type(String type) { _type = type;} // eg. Humanoid, Abberation, Construct etc.
  void set allignment(String allignment) { _alignment = allignment;}
  void set status(String status) { _status = status;}

} // End class Entity  


class Ability {
  final int LIMIT = 20; // Limit for PCs for now.
  final String _name;
  int _score;
  int _mod;
  
  Ability(this._name, [this._score = 0]) {
    calcMod();
  }
  
  int get ability => _score;
  int get mod => _mod;

  @override String toString() => "${_name}: ${_score} (${modAsString()})";
  String modAsString() => "${(_mod >= 0) ? '+' : ''}${_mod.toString()}"; 
  
  void calcMod() {
    _mod = (_score/2 - 5).floor();
  }
  
  // Cap set to 20, can change later.
  void setAbility(int value) {
    if (value > LIMIT) {
      // Oh fuck off.
      _score = LIMIT;
    }
    else if (value < 0) {
      // Wtf are you doing.
      _score = 0;      
    }
    else {
      _score = value;
    }   
    calcMod();
  }
  
  void increaseAbility(int value) {
    _score += value;
    calcMod();
  }
  void decreaseAbility(int value) {
    _score -= value;
    calcMod();
  }
  
}

// Will eventually split Entity into child classes, 
//  but for now, Entity will be the entire Character class.
//class Character extends Entity {
//  Character();
//}



