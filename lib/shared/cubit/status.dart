abstract class AppStatus{}
class initAppState extends AppStatus{}
class changeBtnNavBarState extends AppStatus{}
class changeThemeState extends AppStatus{}
class loadingGetDataBusinessState extends AppStatus{}
class getDataBusinessSuccessState extends AppStatus{}
class getDataBusinessErorrState extends AppStatus{
  final String error;

  getDataBusinessErorrState(this.error);
}

class loadingGetDataSportsState extends AppStatus{}
class getDataSportsSuccessState extends AppStatus{}
class getDataSportsErorrState extends AppStatus{
  final String error;

  getDataSportsErorrState(this.error);
}

class loadingGetDataScinceState extends AppStatus{}
class getDataScinceSuccessState extends AppStatus{}
class getDataScinceErorrState extends AppStatus{
  final String error;

  getDataScinceErorrState(this.error);
}

class loadingGetDataSearchState extends AppStatus{}
class getDataSearchSuccessState extends AppStatus{}
class getDataSearchErorrState extends AppStatus{
  final String error;

  getDataSearchErorrState(this.error);
}