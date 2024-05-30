/// Copyright 2022 Logica Booleana Authors
/*
// Dependencias de Flutter
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Dependencias de la app
import '../../../utils/widgets/widgets_utils_app.dart';
/// Dependencias de  https://pub.dev/
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter_animate/flutter_animate.dart';

// Data Source
class CardData {
  String numberCard ='';
  String name = '';
  String dateValidate = '';
  String code = '';
  CardData({this.numberCard='',this.name='',this.dateValidate='',this.code=''});
  // get
  get isComplete => numberCard.isNotEmpty && name.isNotEmpty && dateValidate.isNotEmpty && code.isNotEmpty;
}

// method
class CardNumberFormatter extends TextInputFormatter {
  // Un TextInputFormatter se puede inyectar opcionalmente en un EditableText para proporcionar validación y formato del texto que se está editando
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,TextEditingValue newValue) {

    // get var
    var inputText = newValue.text;

    if (newValue.selection.baseOffset == 0) { return newValue;  }

    // StringBuffer : Una clase para concatenar cadenas de manera eficiente. Permite la construcción incremental de una cadena usando métodos write*(). Las cadenas se concatenan en una sola cadena solo cuando se llama a toString
    var bufferString = StringBuffer();
    // logic
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }
    var string = bufferString.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length), // Crea una selección colapsada en el desplazamiento dado
    );
  }
}
class DateTimeValidateFormatter extends TextInputFormatter {
  // Un TextInputFormatter se puede inyectar opcionalmente en un EditableText para proporcionar validación y formato del texto que se está editando
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,TextEditingValue newValue) {

    // get var
    var inputText = newValue.text;

    if (newValue.selection.baseOffset == 0) { return newValue;  }

    // StringBuffer : Una clase para concatenar cadenas de manera eficiente. Permite la construcción incremental de una cadena usando métodos write*(). Las cadenas se concatenan en una sola cadena solo cuando se llama a toString
    var bufferString = StringBuffer();
    // logic
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      if (i==1) {
        bufferString.write('/');
      }
    }
    var string = bufferString.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length), // Crea una selección colapsada en el desplazamiento dado
    );
  }
}

// VIEW
class CardCreateForm extends StatefulWidget {
  const CardCreateForm({Key? key}) : super(key: key);

  @override
  State<CardCreateForm> createState() => _CardCreateFormState();
}

class _CardCreateFormState extends State<CardCreateForm> {


// controllers
CarouselController carouselController = CarouselController();

  // var : logic
  double progress = 0.0;
  int currentSlide = 0 ;
  bool isAnimateSave = false;
  bool checkValidateForm = false;
  bool enabledButton = false;
  bool isFront = true;
  // var :  source data
  late CardData cardData = CardData();
  // var : estilo
  Color colorPrimary = Colors.grey;
  Color colorSecundary = Colors.grey;
  late bool isDark ;
  // var : TextFormField
  final numberTextFormFieldfocus = FocusNode();
  final nameTextFormFieldfocus = FocusNode();
  final dateValidateTextFormFieldfocus = FocusNode();
  final codeTextFormFieldfocus = FocusNode();
  final _formKey = GlobalKey<FormState>(); // Crear una clave global que identifique de forma única el widget de formulario y permite la validación del formulario.
 
  // controller
  late FlipCardController _controller;



  
  @override
  void initState() {
    super.initState();
    _controller = FlipCardController();
  }
  @override
  void dispose() {
    super.dispose();
    _controller.state!.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // set : obtenemos los nuevos valores 
    isDark = Theme.of(context).brightness == Brightness.dark;
    

    // SystemUiOverlayStyle : Especifica una preferencia para el estilo de la barra de estado del sistema
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      // Theme : definismos estilos
      child: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: colorPrimary, 
          // style : estilo del button
          elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(colorSecundary),shadowColor: MaterialStateProperty.all(colorSecundary))),
          // style : estilo del AppBar
          appBarTheme: AppBarTheme(elevation: 0,color: Colors.transparent ,systemOverlayStyle: isDark?SystemUiOverlayStyle.light:SystemUiOverlayStyle.light,iconTheme: IconThemeData(color: isDark?Colors.white:Colors.white),titleTextStyle: TextStyle(color: isDark?Colors.white:Colors.white))),
        child: Scaffold(body: body(context: context)),
      ),
    );
  } 
  // MAIN WIDGETS
  PreferredSizeWidget get appbar{

    // values
    Color colorAccent = isDark?Colors.white:Colors.black;

    return AppBar(
      systemOverlayStyle: isDark?SystemUiOverlayStyle.light:SystemUiOverlayStyle.dark,
      iconTheme: IconThemeData(color: colorAccent),
      title: Text('Nueva tarjeta',style:TextStyle(fontSize: 18,fontWeight: FontWeight.w300,color: colorAccent)),
      actions: [WidgetsUtilsApp().buttonThemeBrightness(context: context, buttonColor: Colors.white)],
      
    );
  }
  Widget body({required BuildContext context}){
    
    
    // SingleChildScrollView : Un cuadro en el que se puede desplazar un solo widget
    // Este widget es útil cuando tiene un solo cuadro que normalmente será completamente visible, por ejemplo,la aparición del teclado del sistema, pero debe asegurarse de que se pueda desplazar si el contenedor se vuelve demasiado pequeño en un eje (la dirección de desplazamiento )
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            // Form : Crea un contenedor para campos de formulario
            child: Form(
              key: _formKey, // identifique de forma única el widget de formulario
              child: Column(
                children: [
                  Column(
                    children: [
                      appbar,
                      // view : progress indicator
                      LinearProgressIndicator(backgroundColor: Colors.grey.withOpacity(0.5),valueColor: const AlwaysStoppedAnimation(Colors.blue),minHeight: 2,value: progress),
                      // view : tarjeta animada
                      Padding(padding: const EdgeInsets.all(20.0),child: cardRotate),
                      // formTexts
                      isAnimateSave?Container():textFieldCarrousel(),
                    ],
                    ),
                ],
              ),
            ),
          ),
        ),
        isAnimateSave?Container():Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // button : back
             TextButton(
              onPressed:currentSlide==0?null:(){
              carouselController.previousPage();
              if(currentSlide!=3){_controller.controller!.reverse();}
            }, child: Text('Anterior',style: TextStyle(color: currentSlide==0?Colors.grey:null),)),
            // button : next o save
            Center(
              child: TextButton(
                onPressed: () => next(),
                child: Text( currentSlide == 3 ?'Guardar':'Siguiente')),
            ),
          ],
        )
      ],
    );
  }
  // COMPONENTS WIDGETS
  Widget textFieldCarrousel() {
    // var
    List<Widget> listWidgetss = [numberCardTextFormField, nameCardTextFormField, expiryDateTextFormField,codeTextFormField];

    return SizedBox(
      height: 200,
      width: double.infinity,
      child: CarouselSlider.builder(
        carouselController: carouselController,
        options: CarouselOptions(  
            scrollPhysics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index, reason) {
              currentSlide = index;
              switch(index){
                case 0 :
                  numberTextFormFieldfocus.requestFocus();
                  break;
                case 1 :
                  nameTextFormFieldfocus.requestFocus();
                  break;
                case 2 :
                  dateValidateTextFormFieldfocus.requestFocus();
                  break;
                case 3 :
                  codeTextFormFieldfocus.requestFocus();
                  break;
                default: 
                  break;
              }
              setState(() {});
            },
            enableInfiniteScroll:false,
            //autoPlay: listWidgetss.length == 1 ? false : true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height),
            //options: CarouselOptions(enableInfiniteScroll: lista.length == 1 ? false : true,autoPlay: lista.length == 1 ? false : true,aspectRatio: 2.0,enlargeCenterPage: true,enlargeStrategy: CenterPageEnlargeStrategy.scale),
            itemCount: listWidgetss.length,
            itemBuilder: (context, index, realIndex) {
              //return cardPublicidad(context: context, item: lista[index]);
              // values
              bool focusWidget = currentSlide == index ? true : false;
              // AnimatedOpacity : Versión animada de Opacity que cambia automáticamente la opacidad del niño durante un período determinado cada vez que cambia la opacidad dada
              return AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: focusWidget ? 1.0 : 0.3,
                // widget
                child: listWidgetss[index],
              );
            },
      ),
    );
  }
  Widget get button{
    return SizedBox(width: double.infinity,
    child: ElevatedButton(
      onPressed:  enabledButton?save:null, 
      style:  ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return colorPrimary;
            } else if (states.contains(MaterialState.disabled)) {
              return colorPrimary.withOpacity(0.2);
            }
             return colorPrimary; // Use the component's default.
          },
        ),
      ),
      child: const Padding(
      padding: EdgeInsets.all(12.0),
      child: Text('Agregar nueva tarjeta',style: TextStyle(fontSize: 18)),
    )));
  } 
  Widget get numberCardTextFormField{
    // TextFormField : creamos una entrada númerico
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal:12, vertical: 6),
          child: TextFormField( 
            autovalidateMode: AutovalidateMode.onUserInteraction,
            focusNode: numberTextFormFieldfocus,
            maxLength: 19,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: 'Número de tarjera'),
            onTap: () => _controller.controller!.reverse(),
            onChanged: (value) {
              cardData.numberCard=value;
              colorPrimary = value==''?Colors.grey: Colors.deepPurple;
              colorSecundary = value==''?Colors.grey:Colors.purple;
              setState((){});
            },
            // validator: validamos el texto que el usuario ha ingresado.
            validator: (value) {
              if (value == null || value.isEmpty) { return 'Por favor, introduzca el número de tarjeta correcto'; }
              return null;
            },
            // formateo de texto
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CardNumberFormatter(),
            ],
          ),
        );
  }
  Widget get nameCardTextFormField{
    // TextFormField : creamos una entrada de texto
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal:12, vertical: 6),
          child: TextFormField( 
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autofocus: currentSlide==1,
            maxLength: 20,
            focusNode: nameTextFormFieldfocus,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: 'Nombre completo'),
            onTap: () => _controller.controller!.reverse(),
            onChanged: (value) => setState(() => cardData.name=value ),
            // validator: validamos el texto que el usuario ha ingresado.
            validator: (value) {
              if (value == null || value.isEmpty) { return 'Por favor, introduzca un nombre valido'; }
              return null;
            },
          ),
        );
  }
  Widget get expiryDateTextFormField{
    // TextFormField : creamos una entrada de marca de tiempo
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal:12, vertical: 6),
          child: TextFormField( 
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autofocus: currentSlide==2,
            focusNode: dateValidateTextFormFieldfocus,
            maxLength: 5,
            keyboardType: TextInputType.datetime,
            decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: 'fecha de vencimiento'),
            onTap: () => _controller.controller!.reverse(),
            onChanged: (value) => setState(() => cardData.dateValidate=value),
            // validator: validamos el texto que el usuario ha ingresado.
            validator: (value) {
              if (value == null || value.isEmpty) { return 'Por favor, introduzca una fecha valido'; }
              return null;
            },
            // formateo de texto
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              DateTimeValidateFormatter(),
            ],
          ),
        );
  }
  Widget get codeTextFormField{
    // TextFormField : creamos una entrada númerico
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal:12, vertical: 6),
          child: TextFormField( 
            autofocus: currentSlide==3,
            focusNode: codeTextFormFieldfocus,
            keyboardType: TextInputType.number,
            maxLength: 3,
            decoration: const InputDecoration( border: UnderlineInputBorder(),labelText: 'Código'),
            onTap: () => _controller.controller!.forward(),
            onChanged: (value) => setState(() =>cardData.code=value),
            // validator: validamos el texto que el usuario ha ingresado.
            validator: (value) {
              if (value == null || value.isEmpty) { return 'Por favor, introduzca el código de la tarjeta correcto'; }
              return null;
            },
          ),
        );
  }
  Widget get cardRotate{
    return Center(
      child: FlipCard(speed: 1000,
        controller: _controller,
        onFlip: () => isFront=!isFront,
        back: cardBack,
        front: cardFront,
      ),
    );
  }
  Widget get cardFront{

    // var 
    Decoration decoration = BoxDecoration(gradient:LinearGradient(begin: Alignment.centerLeft,end:Alignment.centerRight,colors: <Color>[colorPrimary,colorSecundary],tileMode: TileMode.mirror));
    final Color background = Colors.grey.shade900;
    final TextStyle dataNumberCardTextStyle = TextStyle(fontSize: 20,color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.bold);
    final TextStyle dataTextStyle = TextStyle(fontSize: 11,color: Colors.white.withOpacity(0.5));
    final TextStyle valueTextStyle = TextStyle(fontSize: 16,color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.bold);
    Icon icon = const Icon(Icons.check,color: Colors.white,size: 75);

    return SizedBox(
        height: 200,width: 300,
        child:  Card(
          shadowColor: colorPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          clipBehavior: Clip.antiAlias,
          elevation: 15,
          color: background,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            decoration: decoration,
            child: isAnimateSave
              ?Center(child: icon.animate().fade(duration: 3000.ms).animate(delay: 3000.ms,onComplete:(_){setState(() {isAnimateSave=false;});}) )
              :Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text('Número de tarjeta',style: dataTextStyle),
                    Text(cardData.numberCard==''?'**   **':cardData.numberCard,style:dataNumberCardTextStyle),
                    const Spacer(),
                    // nombre
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nombre',style:dataTextStyle,overflow: TextOverflow.clip),
                          Text(cardData.name==''?'Juan Perez':cardData.name,style: valueTextStyle,overflow: TextOverflow.clip,maxLines: 1,),
                      ],
                    ),
                    Row(
                      children:[
                        // valido hasta
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('valido hasta',style: dataTextStyle,overflow: TextOverflow.clip),
                            Text(cardData.dateValidate==''?'/':cardData.dateValidate,style:valueTextStyle,overflow: TextOverflow.clip),
                          ],
                        ),
                        const SizedBox(width:12),
                        const Spacer(),
                        Align(
                          alignment: Alignment.topRight,
                          child: Stack(
                            children:  [
                              const CircleAvatar(radius: 20,backgroundColor: Colors.red),
                              Padding(padding: const EdgeInsets.only(left: 12),child: CircleAvatar(radius: 20,backgroundColor: Colors.orange.withOpacity(0.8))),
                              ],
                            ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          )
        ),
      );
  }
  Widget get cardBack{

    // var 
    Decoration decoration = BoxDecoration(gradient:LinearGradient(begin: Alignment.centerLeft,end:Alignment.centerRight,colors: <Color>[colorPrimary,colorSecundary],tileMode: TileMode.mirror));
    final Color background = Colors.grey.shade900;
    final TextStyle dataTextStyle = TextStyle(fontSize: 11,color: Colors.white.withOpacity(0.5));
    final TextStyle valueTextStyle = TextStyle(fontSize: 16,color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.bold);
    Icon icon = const Icon(Icons.check,color: Colors.white,size: 75);

    return SizedBox(
        height: 200,width: 300,
        child:  Card(
          shadowColor: colorPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          clipBehavior: Clip.antiAlias,
          elevation: 15,
          color: background,
          child: Container(
            decoration: decoration,
            child:  isAnimateSave
              ?Center(child: icon.animate().fade(duration: 3000.ms).animate(delay: 3000.ms,onComplete:(_) => defaultValue() ) )
              :Column(
                crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                children: [ 
                  const SizedBox(height: 20,width: double.infinity),
                  Container(height: 40,width: double.infinity,color:colorPrimary),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Text('Código  ',style:dataTextStyle),
                        Text(cardData.code==''?'***':cardData.code,style:valueTextStyle),
                      ],
                    ),
                  )
                ],
              ),
          )
        ),
      );
  }

  //-------------------------//
  //- FUNCTIONS LOGIC START -//
  //-------------------------//
  void checkValidatorFroms({required bool check}){
    // function : validamos el formulario

    // button onClick
    if(check){
      _formKey.currentState!.validate();
    }
    // onchange texfieldFrom
    if(check = false & checkValidateForm){
      _formKey.currentState!.validate();
    }
    // comprobamos si los datos estan completos
    enabledButton = cardData.isComplete;

    // set values 
    checkValidateForm = check;
  }
  void save() async {
    // function : procedemos a verificar el formulario y simular el salvado de los datos con una animacion
    
    if(cardData.isComplete){
       // Validar devuelve verdadero si el formulario es válido o falso en caso contrario.
      checkValidateForm=true;
      // validate : Si el formulario es válido,
      if (_formKey.currentState!.validate()) { 
        // view : animated
        isAnimateSave = true;
        progress=1.0;
        _controller.controller!.reverse();
        
        // actualizamos el estado de las vistas
        setState(() {});
      }
    }else{
      // SnackBar : Un mensaje ligero con una acción opcional que se muestra brevemente en la parte inferior de la pantalla
      final snackBar = SnackBar(
        clipBehavior:Clip.antiAlias ,
        content: const Text('Complete el formulario'),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(label: 'ok',onPressed: () {}), 
      );
      // show
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  void next(){
    // function : verificamos que el campor actual este completo para pasar al siguiente campo y complertar el formulario

    // value 
    bool next = true;
    // comprobamos que el campo este completo para avanzar al siguiente
    if(currentSlide == 0 && cardData.numberCard == ''){
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Debe completar los datos')));
      next=false;
    }
    if(currentSlide == 1 && cardData.name == ''){
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Debe completar los datos')));
      next=false;
    }
    if(currentSlide == 2 && cardData.dateValidate == ''){
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Debe completar los datos')));
      next=false;
    }
    if(currentSlide == 3 && cardData.code == ''){
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Debe completar los datos')));
      next=false;
    }
    // mostramos la parte trasera de la tarjeta
    if(currentSlide==2){_controller.controller!.forward();
    }else{_controller.controller!.reverse();}
    // carrousel textfield : pasa a la siquiente vista si es posible
    if(next){carouselController.nextPage();}
    
    // estado de progreso
    switch(currentSlide){
      case 0: progress = 0.25; break;
      case 1: progress = 0.50; break;
      case 2: progress = 0.75; break;
      case 3: progress = 1.0; break;
      default: progress;
    }

    // el formulario esta completo
    if(currentSlide == 3){save();}

    setState(() {});
  }
  void defaultValue(){
    // function : resetemos todos los valores
    setState(() {
      currentSlide=0;
      checkValidateForm=false;
      enabledButton = false;
      cardData =  CardData();
      _formKey.currentState!.reset();
      isAnimateSave=false;
      progress=0.0;}
      );
  }

  //-------------------------//
  //- FUNCTIONS LOGIC FINAL -//
  //-------------------------//
}
///////////////////////////////////////
بالطبع! يمكنك استخدام الكود التالي لعرض المحتويات المذكورة في الـ `Dialog`:

```dart
import &#x27;dart:io&#x27;;
import &#x27;package:flutter/material.dart&#x27;;
import &#x27;package:path_provider/path_provider.dart&#x27;;
import &#x27;package:flutter/services.dart&#x27; show rootBundle;

void main() =&gt; runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: pickcv(),
    );
  }
}

class pickcv extends StatefulWidget {
  @override
  _pickcvState createState() =&gt; _pickcvState();
}

class _pickcvState extends State&lt;pickcv&gt; {
  String? selectedFileName;
  bool isFileSaved = false;

  void _pickPDFFile(BuildContext context) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File(&#x27;${directory.path}/sample.pdf&#x27;);
      
    if (await file.exists()) {
      setState(() {
        selectedFileName = &#x27;sample.pdf&#x27;;
        isFileSaved = true;
      });
    } else {
      final bytes = await rootBundle.load(&#x27;assets/sample.pdf&#x27;);
      await file.writeAsBytes(bytes.buffer.asUint8List());
      setState(() {
        selectedFileName = &#x27;sample.pdf&#x27;;
        isFileSaved = false;
      });
    }
  }

  void _saveFile() {
    // Write code here to save the file
    setState(() {
      isFileSaved = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(&#x27;Dialog Example&#x27;),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(&#x27;My Dialog&#x27;),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () => _pickPDFFile(context),
                        child: Container(
                          width: 60,
                          height: 80,
                          margin: EdgeInsets.all(30),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'انقر هنا لتحميل ملف PDF',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      if (selectedFileName != null)
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    selectedFileName!,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  if (isFileSaved)
                                    const Text(
                                     'تم حفظ ملف CV'
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 16,
                                      ),
                                    )
                                  else
                                    ElevatedButton(
                                      onPressed: _saveFile,
                                      child: Text('حفظ الملف'),
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('إغلاق'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('عرض الـ '),
        ),
      ),
    );
  }
}
*/
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class pickcv extends StatefulWidget {
  const pickcv({Key? key}) : super(key: key);

  @override
  _pickcvState createState() => _pickcvState();
}

class _pickcvState extends State<pickcv> {
  String? fileName;

  Future<void> _openFileExplorer() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("أضف جديد"),
                        content: Container(
                          height: 150,
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: _openFileExplorer,
                                child: Text('اختر ملف'),
                              ),
                              SizedBox(height: 20),
                              Text(fileName ?? 'لم يتم تحديد أي ملف'),
                            ],
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AnotherPage(),
                                ),
                              );
                            },
                            child: Text('التالي'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('إغلاق'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(Icons.upload_file),
                label: Text('تحميل سيرتك الذاتية'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  const AnotherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('صفحة أخرى'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('هذه صفحة أخرى'),
            ],
          ),
        ),
      ),
    );
  }
}
