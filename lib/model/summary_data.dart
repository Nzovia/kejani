

class GradesData {
  final String gradeSymbol;
  final int numberOfStudents;

  GradesData(this.gradeSymbol, this.numberOfStudents);
}
final data = [
  GradesData('A', 190),
  GradesData('B', 230),
  GradesData('C', 150),
  GradesData('D', 73),
  GradesData('E', 31),
  GradesData('Fail', 13),
];

// _getSeriesData() {
//   List<charts.Series<GradesData, String>> series = [
//     charts.Series(
//         id: "Grades",
//         data: data,
//         labelAccessorFn: (GradesData row, _) => '${row.gradeSymbol}: ${row.numberOfStudents}',
//         domainFn: (GradesData grades, _) => grades.gradeSymbol,
//         measureFn: (GradesData grades, _) => grades.numberOfStudents
//     )
//   ];
//   return series;
// }