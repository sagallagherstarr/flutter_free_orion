
import "package:flutter/material.dart";

import "package:logging_flutter/logging_flutter.dart";

// This widget holds the buttons / actions for the Command buttons - App menu,
// production, SitRep, etc.

// It is meant to be a layer beside the background, fixed in place
// above the main content.

// The command buttons are:

// Next turn - located all the way to the left of the bar

// aligned on the right:

// Production panel - pops open/hides the Production manager panel
// SitRep panel - pops open/hides the situation report (SitRep) panel
// MainAppMenu - pops open/hides the main app menu

// class ImageButton extends StatelessWidget {
//   final ImageProvider image;
//
//   const ImageButton({super.key, required this.image});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Button
//   }
// }

class TopMenuCommandButton extends StatelessWidget {
  final String assetKey;
  final String logMessage;
  final void Function() action;

  const TopMenuCommandButton({
    super.key,
    required this.assetKey,
    required this.logMessage,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      // iconSize: 24,
      constraints: const BoxConstraints(maxHeight: 36),
      icon: Ink.image(
          image: AssetImage(assetKey,
              bundle: DefaultAssetBundle.of(context)
          )
      ),
      onPressed: () {
        Flogger.i(logMessage);
        action();
      },
    );
  }
}

const String buttonIcons = "assets/data/art/icons/buttons";

String buttonIconAssetKey(String buttonName) =>
    "$buttonIcons/${buttonName}_clicked.png";

class TopCommandButtonRow extends StatelessWidget {
  const TopCommandButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    // NB including the constants here rather than, say at the class level or
    // even globally is only necessary for debugging purposes; the app live-reloads
    // only when the build process changes.

    // const String buttonIcons = "assets/data/art/icons/buttons";

    final buttonList = [
      (buttonIconAssetKey("sitrep"), "SitRep Menu icon pushed", 'This is a SitRepMenuIcon'),
      (buttonIconAssetKey("production"), "Production Menu icon pushed", 'This is a ProductionMenuIcon'),
      (buttonIconAssetKey("research"), "Research Menu icon pushed", 'This is a ResearchMenuIcon'),
      (buttonIconAssetKey("objects"), "Objects Menu icon pushed", 'This is an ObjectsMenuIcon'),
      (buttonIconAssetKey("empires"), "Empires Menu icon pushed", 'This is an EmpiresMenuIcon'),
      (buttonIconAssetKey("design"), "Design Menu icon pushed", 'This is a DesignMenuIcon'),
      (buttonIconAssetKey("messages"), "Messages Menu icon pushed", 'This is a MessagesMenuIcon'),
      (buttonIconAssetKey("pedia"), "Pedia Menu icon pushed", 'This is a PediaMenuIcon'),
      (buttonIconAssetKey("menu"), "Application Menu icon pushed", 'This is an AppMenuIcon'),
    ];

    // final String appMenuIcon = buttonIconAssetKey("menu");
    // final String productionMenuIcon = buttonIconAssetKey("production");
    // final String scienceMenuIcon = buttonIconAssetKey("research");
    // final String objectsMenuIcon = buttonIconAssetKey("objects");
    // final String empiresMenuIcon = buttonIconAssetKey("empires");
    // final String designMenuIcon = buttonIconAssetKey("design");
    // final String messagesMenuIcon = buttonIconAssetKey("messages");
    // final String pediaMenuIcon = buttonIconAssetKey("pedia");

    // const String appMenuIcon = "$buttonIcons/menu_clicked.png";
    // const productionMenuIcon = "$buttonIcons/production_clicked.png";
    // const scienceMenuIcon = "$buttonIcons/research_clicked.png";

    IconThemeData themeData = IconTheme.of(context).copyWith(
      size: 24
    );

    return IconTheme(
      data: themeData,
      child: Row(
        children: <Widget>[
          for (var item in buttonList)
            Flexible(
              child:
                TopMenuCommandButton(
                  assetKey: item.$1,
                  logMessage: item.$2,
                  action:() => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(item.$3)))
                )
            )

          // Flexible(child:
          //   TopMenuCommandButton(
          //     assetKey: productionMenuIcon,
          //     logMessage: "Product Menu icon pushed",
          //     action: () => ScaffoldMessenger.of(context).showSnackBar(
          //       const SnackBar(content: Text('This is a ProductionMenuIcon')))
          //   ),
          // ),
          // Flexible(child:
          //   TopMenuCommandButton(
          //     assetKey: appMenuIcon,
          //     logMessage: "Product Menu icon pushed",
          //     action: () => ScaffoldMessenger.of(context).showSnackBar(
          //       const SnackBar(content: Text('This is an AppMenuIcon')))
          //   ),
          // ),
          // Flexible(
          //   child: TopMenuCommandButton(
          //     assetKey: scienceMenuIcon,
          //     logMessage: "Science Menu icon pushed",
          //     action: () => ScaffoldMessenger.of(context).showSnackBar(
          //       const SnackBar(content: Text("This is a ScienceMenuIcon"))
          //     )
          //   ),
          // )
        ],
      )
    );
  }
}
