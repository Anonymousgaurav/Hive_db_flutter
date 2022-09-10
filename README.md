

1.First import hive. At that point, add ‘data_model.g.dart’ as a section (this is where the type adapter is generated).
Clarify the model class with @HiveType(), so the generator realizes this should be a TypeAdapter. 
Annotate on each field you need to save with @HiveField(index), the index is an int, and each index ought to show up once, 
and you shouldn’t transform it in the wake of enlisting them. 
We have three factors like title, description, and complete to store, and they are explained as @HiveField.

2. We will run a code generator by typing the following command in the terminal which will automatically generate database code for us.

$ flutter packages pub run build_runner build

3. flutter secure storage:
   A Flutter plugin to store data in secure storage:

   Keychain is used for iOS
   AES encryption is used for Android. AES secret key is encrypted with RSA and RSA key is stored in KeyStore.