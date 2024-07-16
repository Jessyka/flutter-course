class Question{
  String question = '';
  Option fistOption = new Option('', 1);
  Option secondOption = new Option('', 2);
  Option thirdOption = new Option('', 3);
  int correctOption = 0;

  Question(String question, String fistOption, String secondOption, String thirdOption, int correctOption) {
    this.question = question;
    this.correctOption = correctOption;
    this.fistOption.setDescription(fistOption);
    this.secondOption.setDescription(secondOption);
    this.thirdOption.setDescription(thirdOption);
  }
}

class Option{
  String description;
  final int value;

  Option(this.description, this.value);

  void setDescription(String description){
    this.description = description;
  }
}