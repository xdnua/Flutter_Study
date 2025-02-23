import 'package:lam_quen_flutter/quiz_app/models/quiz_questions.dart';

List<QuizQuestion> questions = [
  QuizQuestion(
    'Các khối xây dựng chính của giao diện Flutter là gì?',
    ['Widget', 'Thành phần (Component)', 'Khối (Block)', 'Hàm (Function)'],
  ),
  QuizQuestion(
    'Giao diện Flutter được xây dựng như thế nào?',
    [
      'Bằng cách kết hợp các widget trong mã',
      'Bằng cách kết hợp các widget trong trình chỉnh sửa giao diện trực quan',
      'Bằng cách định nghĩa widget trong các tệp cấu hình',
      'Bằng cách sử dụng XCode cho iOS và Android Studio cho Android',
    ],
  ),
  QuizQuestion(
    'Mục đích của StatefulWidget là gì?',
    [
      'Cập nhật giao diện khi dữ liệu thay đổi',
      'Cập nhật dữ liệu khi giao diện thay đổi',
      'Bỏ qua các thay đổi dữ liệu',
      'Hiển thị giao diện không phụ thuộc vào dữ liệu',
    ],
  ),
  QuizQuestion(
    'Bạn nên sử dụng loại widget nào thường xuyên hơn: StatelessWidget hay StatefulWidget?',
    [
      'StatelessWidget',
      'StatefulWidget',
      'Cả hai đều tốt như nhau',
      'Không có đáp án đúng'
    ],
  ),
  QuizQuestion(
    'Điều gì xảy ra nếu bạn thay đổi dữ liệu trong StatelessWidget?',
    [
      'Giao diện không được cập nhật',
      'Giao diện được cập nhật',
      'StatefulWidget gần nhất được cập nhật',
      'Bất kỳ StatefulWidget lồng nhau nào cũng được cập nhật',
    ],
  ),
  QuizQuestion(
    'Bạn nên cập nhật dữ liệu bên trong StatefulWidget như thế nào?',
    [
      'Bằng cách gọi setState()',
      'Bằng cách gọi updateData()',
      'Bằng cách gọi updateUI()',
      'Bằng cách gọi updateState()'
    ],
  ),
];
