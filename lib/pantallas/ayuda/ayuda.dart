import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
import 'dart:ui_web' as ui;

class AyudaPantalla extends StatefulWidget {
  const AyudaPantalla({super.key});

  @override
  State<AyudaPantalla> createState() => _AyudaPantallaState();
}

class _AyudaPantallaState extends State<AyudaPantalla> {
  final String url = "www.google.com";
  bool _isLoading = true;
  bool _isWeb = false;

  @override
  void initState() {
    super.initState();
    _isWeb = identical(0, 0.0); // Detectar si es web

    if (_isWeb) {
      _setupWebView();
    }
  }

  void _setupWebView() {
    ui.platformViewRegistry.registerViewFactory('iframeElement', (int viewId) {
      final iframe = html.IFrameElement()
        ..src = url
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.overflow = 'hidden'
        ..onLoad.listen((event) {
          setState(() {
            _isLoading = false;
          });
        });

      return iframe;
    });
  }

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayuda'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        actions: [
          if (!_isWeb)
            IconButton(
              icon: const Icon(Icons.open_in_browser),
              onPressed: _launchUrl,
              tooltip: 'Abrir en navegador',
            ),
        ],
      ),
      body: _isWeb
          ? Stack(
              children: [
                const HtmlElementView(viewType: 'iframeElement'),
                if (_isLoading)
                  Container(
                    color: Colors.white,
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 16),
                          Text('Cargando página...'),
                        ],
                      ),
                    ),
                  ),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Presiona el botón para abrir la página de ayuda',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _launchUrl,
                    icon: const Icon(Icons.open_in_browser),
                    label: const Text('Abrir página'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
