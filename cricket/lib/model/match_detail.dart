class MatchDetail {
  String currentTeam;
  String otherTeam;
  String currentTeamScore;
  String otherTeamScore;
  // bool matchStarted;
  //String time;
  String winner;
  String matchId;
  MatchDetail({
    required this.currentTeamScore,
    required this.otherTeamScore,
    required this.currentTeam,
    required this.otherTeam,
    // required this.matchStarted,
    // required this.time,
    required this.winner,
    required this.matchId,
  });
}
