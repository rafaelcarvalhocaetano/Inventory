# inventory
 - flutter packages pub run build_runner watch
# API
 - https://github.com/rafaelcarvalhocaetano/Inventory-API

color = {
#5483f8 - 1,
#f9a595 - 2,
#fdc185 - 3,
#62ce84 - 4,
#a9a3dc - 5,
#e2867b - 6,
#be8ad2 - 7,
#57bac4 - 8

path image: /data/user/0/com.inventory.inventory/cache/image_picker6223417638418386568.jpg

path image: /storage/emulated/0/Android/data/com.inventory.inventory/files/Pictures/71072821-3403-4f4e-af79-c23baaaade085084062221258846933.jpg

mesma imagem

tirada: /storage/emulated/0/Android/data/com.inventory.inventory/files/Pictures/af035e06-df7b-4b4e-9c60-64cb0f70eb4d7143559083952936109.jpg

galeria: /data/user/0/com.inventory.inventory/cache/image_picker7606829256568428713.jpg

RenderRepaintBoundary boundary =
        previewContainer.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();

    print(pngBytes);
    File imgFile = new File('$directory/screenshot.png');
    imgFile.writeAsBytes(pngBytes);


fundo - #fcfcfc
header title - #5786ff,
text - #4d4d4d,
text-secundary - #898989,

text-footer-primary-card - #727272
text-footer-card - #c9c9c9

}
