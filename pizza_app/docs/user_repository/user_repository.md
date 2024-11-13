## create lib
    create user_repository.dart
    create src
    create o pubspec.yml

## Dentro de src
    create entities
    create models

## Ordem
criar as funcoes no user_repo.dart
setou as classes do firebase_user_repo.dart
exportou no models/models.dart
criou o models/user.dart
criou o entities/user_entity.dart

## src/user_repo.dart
o user_repo tem como objetivo organizar e centralizar todas as operações relacionadas a usuários de maneira clara e desacoplada. Isso significa que, em vez de espalhar lógica de autenticação e gerenciamento de usuários pelo código, você coloca tudo em um lugar só.

Em resumo, o user_repo ajuda a deixar o código organizado, flexível e fácil de manter.

## src/entities/user_entytity.dart
O arquivo user_entity.dart define a classe MyUserEntity, que serve como uma representação simples e estruturada dos dados do usuário no sistema. Essa entidade é usada para mapear os dados do banco de dados (ou outro armazenamento) para o formato esperado pela aplicação e vice-versa.

### src/models/user.dart
O arquivo user.dart define a classe MyUser, que representa o modelo de usuário usado dentro da aplicação. Essa classe é separada da entidade (MyUserEntity) porque elas têm objetivos ligeiramente diferentes.

Por que criar o MyUser?

	1.	Modelo de domínio:
	•	MyUser representa o usuário em um formato que é usado pela aplicação, como na interface do usuário ou na lógica de negócios.
	2.	Abstração:
	•	Enquanto o MyUserEntity é focado no armazenamento e transferência de dados, MyUser abstrai esses detalhes e oferece um modelo para a aplicação trabalhar.
	3.	Separação de responsabilidades:
	•	Manter o modelo (MyUser) e a entidade (MyUserEntity) separados segue boas práticas de design, facilitando manutenção e adaptabilidade.

### src/firebase_user_repo.dart
O arquivo firebase_user_repo.dart implementa a interface UserRepository usando Firebase como backend para autenticação e armazenamento de dados de usuários. Ele conecta o modelo da aplicação (MyUser) ao Firebase Authentication e ao Firestore, permitindo gerenciar usuários com facilidade.