import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final int totalScore;
  final Function onRestartQuiz;

  const ResultScreen({
    required this.totalScore,
    required this.onRestartQuiz,
  });

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    if (widget.totalScore == 20) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.totalScore == 20)
              ScaleTransition(
                scale: _animation,
                child: Text(
                  'Congratulations!',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            SizedBox(height: 20),
            Text(
              'Your Total Score: ${widget.totalScore}',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Reset quiz when play again button is pressed
                widget.onRestartQuiz();
                Navigator.of(context).pop(); // Pop result screen
              },
              child: Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
//
// class ResultScreen extends StatelessWidget {
//   final int totalScore;
//   final Function onRestartQuiz;
//
//   const ResultScreen({
//     required this.totalScore,
//     required this.onRestartQuiz,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Quiz Result'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Your Total Score: $totalScore',
//               style: TextStyle(fontSize: 24),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Reset quiz when play again button is pressed
//                 onRestartQuiz();
//                 Navigator.of(context).pop(); // Pop result screen
//               },
//               child: Text('Try Again'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
