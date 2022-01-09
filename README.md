# meals

 Meals é uma aplicação android simples feita em Flutter para listar receitas.
 
A aplicação consiste em:

  <ul>
    <li><h3>Listar categorias de refeições.</h3>
      <small style="font-size: 8px;">Lista todas categorias disponiveis.</small>
      <br>
       <img width="400px" src="https://user-images.githubusercontent.com/73388069/148690095-6adb2143-ca71-4a18-b2f1-a85c2e8b0c83.jpg">

</li>
  
   <li><h3>Listar refeições de uma certa categoria.</h3> 
      <small style="font-size: 8px;">Lista todas refeições de uma categoria selecionada.</small>
     <br>
     <img width="400px" src="https://user-images.githubusercontent.com/73388069/148690137-3bd529a2-b88c-42da-8f65-a9f6679457f4.jpg">
</li>
    
   <li><h3>Listar detalhes de uma refeição especifica e como fazê-la.</h3>
      <small style="font-size: 8px;">Lista os detalhes de uma refeição selecionada.</small>
     <br> <img width="400px" src="https://user-images.githubusercontent.com/73388069/148690167-757cd8e8-34e2-4d69-9153-04b0ef145512.jpg">
</li>
  
  <li><h3>Menu de navegação.</h3>
     <small style="font-size: 8px;">Menu de navegação para navegar para tela de Refeições / Configurações.</small>
    <br> <img width="400px" src="https://user-images.githubusercontent.com/73388069/148690246-7ae67791-9c74-4cb1-bd4b-c34d9200cf04.jpg">
</li>
  
   
  
   <li>
      <h3>Tela de configurações para filtrar as refeições.</h3> 
      <small style="font-size: 8px;">Tela de configurações é responsável por adicionar filtros nos quais vão definir quais refeições devem ou não aparecer.</small>
      <br>
      <img width="400px" src="https://user-images.githubusercontent.com/73388069/148690280-9e565dc7-1a20-4c16-9014-0873e6e82326.jpg">
  </li>

   <li>
      <h3>Tela de favoritos.</h3> 
       <small style="font-size: 8px;">É responsável por listar todas refeições marcadas como "Favorito"</small>
      <br>
      <img width="400px" src="https://user-images.githubusercontent.com/73388069/148690459-f00903dc-06c1-46f4-ba41-a4314c73a6f0.jpg">
  </li>
  
  
  </ul>

<hr/>

Mais uma aplicação simples feita no <a href="https://www.udemy.com/course/curso-flutter/" >curso de Flutter</a>, na qual aprendi vários conceitos novos, nos quais:
<ul>
  <li>
     <h2>
        Navegação entre telas
      </h2>
       A navegação entre multiplas telas acredito que tenha sido o principal conceito que tive contato fazendo este Aplicativo!
       <br>
      Basicamente, usei rotas nomeadas para fazer a navegação, inicialmente criando uma classe com membros estáticos que representavam o nome de cada rota:
    
    
  ~~~dart
    class AppRoutes {
      static const HOME = '/';
      static const CATEGORIES_MEALS = '/categories-meals';
      static const MEAL_DETAIL = '/meal-detail';
      static const SETTINGS = '/settings';
    }
  ~~~
    
   E apartir destes membros estáticos, criei as rotas no arquivo main.dart

   ~~~dart
   routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(favoriteMeals: _favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(
            onToggleFavorite: _toggleFavorite, isFavorite: _isFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(
              onSettingsChanged: _filterMeals,
              settings: settings,
            ),
      },
  ~~~
    
 E quando havia a necessidade de irmos à rota de Configurações, por exemplo, eu usava o Navigartor puxando o contexto da aplicação e puxando para a AppRoutes.SETTINGS, dessa maneira:
~~~dart
   Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS)
~~~
   
  </li>
</ul>
