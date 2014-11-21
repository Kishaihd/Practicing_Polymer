library model.Skill;

import 'Ability.dart';
import 'Entity.dart';

class Skill {
  String _name;
  int _value;
  Ability _ability;
  bool isAClassSkill = false;
  
  Skill(this._name, Ability ability) {
    setValue(ability.score);
  }
  
  void setValue(int value) {
    _value = value;
  }
  
  void increaseValue(int value) {
    _value += value;
  }
  
  void isClassSkill(bool answer) {
    if (isAClassSkill == true) {
      _value += _proficiency;
    }
    if (isAClassSkill == false) {
      
    }
    
  }
  
  int get score => _value;
    
}