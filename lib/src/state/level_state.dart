const gameLevelList = [
  LevelState(number: 1, levelName: '쉬움', difficulty: 1),
  LevelState(number: 2, levelName: '보통', difficulty: 2),
  LevelState(number: 3, levelName: '어려움', difficulty: 3),
];

class LevelState {
  final int number;
  final String levelName;
  final int difficulty;

  const LevelState({
    required this.number,
    required this.levelName,
    required this.difficulty,
  });
}
