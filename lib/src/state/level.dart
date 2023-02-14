const gameLevelList = [
  Level(number: 1, levelName: '쉬움', difficulty: 1),
  Level(number: 2, levelName: '보통', difficulty: 2),
  Level(number: 3, levelName: '어려움', difficulty: 3),
];

class Difficulty {
  final int time = 30;
  final int flagCount;

  const Difficulty(this.flagCount);
}

class Level extends Difficulty {
  final int number;
  final String levelName;
  final int difficulty;

  const Level({
    required this.number,
    required this.levelName,
    required this.difficulty,
  }) : super((difficulty + 1) * 3);
}
