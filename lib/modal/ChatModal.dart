class ChatModel{
  String name;
  String lastChat;
  String time;
  String avatarUrl;

  ChatModel(this.name, this.lastChat, this.time, this.avatarUrl);
}

List<ChatModel> dummyList = [
  ChatModel(
      "Vishal Rana",
      "I am so busy, and what about you?",
      "15:09",
      "https://www.uni-regensburg.de/Fakultaeten/phil_Fak_II/Psychologie/Psy_II/beautycheck/english/prototypen/w_sexy_gr.jpg"),
  ChatModel("K Rana",
      "You are always busy",
      "15:10",
      "https://i.pinimg.com/236x/81/0c/2a/810c2a2c77129d2fe5dcbd624d42a538--dark-brown-eyes-gray-eyes.jpg"),
  ChatModel(
      "John Doe",
      "Don't disturb mee",
      "15:11",
      "https://www.uni-regensburg.de/Fakultaeten/phil_Fak_II/Psychologie/Psy_II/beautycheck/english/prototypen/w_sexy_gr.jpg"),
  ChatModel("Jemmy Warner",
      "You should give time to mee.",
      "15:12",
      "https://i.pinimg.com/236x/81/0c/2a/810c2a2c77129d2fe5dcbd624d42a538--dark-brown-eyes-gray-eyes.jpg"),
  ChatModel(
      "Stuart John",
      "Yes, If I have.",
      "15:15",
      "https://www.uni-regensburg.de/Fakultaeten/phil_Fak_II/Psychologie/Psy_II/beautycheck/english/prototypen/w_sexy_gr.jpg"),
  ChatModel("John Snow",
      "You messaged me late. ",
      "15:15",
      "https://i.pinimg.com/236x/81/0c/2a/810c2a2c77129d2fe5dcbd624d42a538--dark-brown-eyes-gray-eyes.jpg"),
];