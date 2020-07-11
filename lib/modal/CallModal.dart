class CallModel {
  String name;
  bool isVideoCall;
  String time;
  String avatarUrl;
  String callStatus;

  CallModel(
      this.name, this.isVideoCall, this.time, this.avatarUrl, this.callStatus);
}

List<CallModel> dummyCallList = [
  CallModel(
      "Vishal Rana",
      true,
      "Just now",
      "https://www.uni-regensburg.de/Fakultaeten/phil_Fak_II/Psychologie/Psy_II/beautycheck/english/prototypen/w_sexy_gr.jpg",
      "I"),
  CallModel(
      "K Rana",
      true,
      "Yesterday, 09:20 PM",
      "https://i.pinimg.com/236x/81/0c/2a/810c2a2c77129d2fe5dcbd624d42a538--dark-brown-eyes-gray-eyes.jpg",
      "O"),
  CallModel(
      "John Doe",
      false,
      "Yesterday, 11:48 AM",
      "https://www.uni-regensburg.de/Fakultaeten/phil_Fak_II/Psychologie/Psy_II/beautycheck/english/prototypen/w_sexy_gr.jpg",
      "M"),
  CallModel(
      "Jemmy Warner",
      true,
      "2019-09-22, 04:20 AM",
      "https://i.pinimg.com/236x/81/0c/2a/810c2a2c77129d2fe5dcbd624d42a538--dark-brown-eyes-gray-eyes.jpg",
      "O"),
  CallModel(
      "Stuart John",
      false,
      "2019-08-21, 12:20 AM",
      "https://www.uni-regensburg.de/Fakultaeten/phil_Fak_II/Psychologie/Psy_II/beautycheck/english/prototypen/w_sexy_gr.jpg",
      "I"),
  CallModel(
      "Arya Stark",
      false,
      "2019-06-09, 09:50 PM",
      "https://i.pinimg.com/236x/81/0c/2a/810c2a2c77129d2fe5dcbd624d42a538--dark-brown-eyes-gray-eyes.jpg",
      "M")
];
