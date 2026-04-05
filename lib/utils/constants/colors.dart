import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // ! prevents creating of object

  // Primary Color
  static const Color primary = Color(0xFF0857A0);
  // static const Color primary = Color.fromARGB(255, 210, 101, 6);

  // Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // Background colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);

  // Button colors
  static const Color buttonPrimary = Color(0xFF0857A0);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  static const Color yellow = Color(0xFFFFE24B);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);

  // Additional Accents & Pastels
  static const Color coral = Color(0xFFFF6B6B);
  static const Color peach = Color(0xFFFFD1A4);
  static const Color mint = Color(0xFFB2F2BB);
  static const Color skyBlue = Color(0xFF74C0FC);
  static const Color lavender = Color(0xFFD0BFFF);
  static const Color salmon = Color(0xFFFA8072);
  static const Color royalBlue = Color(0xFF0052D4);
  static const Color deepPurple = Color(0xFF673AB7);
  static const Color indigo = Color(0xFF3F51B5);
  static const Color teal = Color(0xFF009688);

  // Soft Backgrounds (Tinted)
  static const Color softBlue = Color(0xFFE3F2FD);
  static const Color softGreen = Color(0xFFE8F5E9);
  static const Color softRed = Color(0xFFFFEBEE);
  static const Color softYellow = Color(0xFFFFFDE7);
  static const Color softOrange = Color(0xFFFFF3E0);
  static const Color softPurple = Color(0xFFF3E5F5);

  // Material-Style Greys (Finer Gradients)
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);

  // Vibrant UI Feedback
  static const Color active = Color(0xFF2979FF);
  static const Color online = Color(0xFF00E676);
  static const Color offline = Color(0xFF9E9E9E);
  static const Color away = Color(0xFFFFC107);
  static const Color link = Color(0xFF1E88E5);

  // Earthy Tones
  static const Color brown = Color(0xFF795548);
  static const Color sand = Color(0xFFC2B280);
  static const Color olive = Color(0xFF808000);
  static const Color forestGreen = Color(0xFF228B22);
  static const Color slate = Color(0xFF708090);

  // Dark Mode Variations
  static const Color darkSurface = Color(0xFF121212);
  static const Color darkCard = Color(0xFF1E1E1E);
  static const Color darkBorder = Color(0xFF333333);
  static const Color darkHeader = Color(0xFF1A1A1A);

  // Bright Neon/High Contrast
  static const Color neonGreen = Color(0xFF39FF14);
  static const Color hotPink = Color(0xFFFF69B4);
  static const Color electricBlue = Color(0xFF7DF9FF);
  static const Color brightOrange = Color(0xFFFFAC1C);
  static const Color gold = Color(0xFFFFD700);

  // Transparent/Overlay Shades
  static const Color blackOverlay = Color(0x80000000); // 50% Black
  static const Color whiteOverlay = Color(0x80FFFFFF); // 50% White
  static const Color shadow = Color(0x1F000000); // Light shadow
  static const Color transparent = Colors.transparent;
  static const Color glass = Color(0x1AFFFFFF); // Glassmorphism base

  // Material 3 Tonal Palettes (Primary/Secondary variations)
  static const Color primaryLight = Color(0xFFD1E4FF);
  static const Color primaryDark = Color(0xFF00325B);
  static const Color secondary = Color(0xFF535F70);
  static const Color secondaryContainer = Color(0xFFD7E3F7);
  static const Color tertiary = Color(0xFF6B5778);
  static const Color tertiaryContainer = Color(0xFFF2DAFF);

  // Jewel Tones (Luxury/High-end UI)
  static const Color emerald = Color(0xFF046307);
  static const Color ruby = Color(0xFF900C3F);
  static const Color sapphire = Color(0xFF0F52BA);
  static const Color amethyst = Color(0xFF9966CC);
  static const Color amber = Color(0xFFFFBF00);
  static const Color bronze = Color(0xFFCD7F32);

  // Expanded Pastel/Soft UI
  static const Color rose = Color(0xFFFCE4EC);
  static const Color lemon = Color(0xFFFFF9C4);
  static const Color apricot = Color(0xFFFFE0B2);
  static const Color clay = Color(0xFFEFEBE9);
  static const Color mist = Color(0xFFE0F2F1);
  static const Color cloud = Color(0xFFECEFF1);

  // Professional Greys (Cool & Warm)
  static const Color coolGrey = Color(0xFF8E9AAF);
  static const Color warmGrey = Color(0xFFBCAAA4);
  static const Color blueGrey = Color(0xFF607D8B);
  static const Color charcoal = Color(0xFF36454F);
  static const Color gunmetal = Color(0xFF2A3439);
  static const Color iron = Color(0xFF525C65);

  // Deep Dark Mode Accents
  static const Color deepNavy = Color(0xFF011627);
  static const Color deepSpace = Color(0xFF1B1B1E);
  static const Color obsidian = Color(0xFF0B0B0B);
  static const Color midnight = Color(0xFF101720);
  static const Color darkSlate = Color(0xFF2F4F4F);

  // Vibrant Accents
  static const Color magenta = Color(0xFFFF00FF);
  static const Color lime = Color(0xFFCDDC39);
  static const Color violet = Color(0xFF8B00FF);
  static const Color cyan = Color(0xFF00FFFF);
  static const Color tomato = Color(0xFFFF6347);
  static const Color sunset = Color(0xFFFD5E53);

  // Status & Subtle Notifications
  static const Color badgeRed = Color(0xFFFF3B30);
  static const Color badgeGreen = Color(0xFF34C759);
  static const Color neutralInfo = Color(0xFFE1F5FE);
  static const Color neutralWarning = Color(0xFFFFF3E0);
  static const Color neutralError = Color(0xFFFFEBEE);

  // Transparent Opacity Steps (White)
  static const Color white10 = Color(0x1AFFFFFF);
  static const Color white20 = Color(0x33FFFFFF);
  static const Color white30 = Color(0x4DFFFFFF);
  static const Color white70 = Color(0xB3FFFFFF);

  // Transparent Opacity Steps (Black)
  static const Color black10 = Color(0x1A000000);
  static const Color black20 = Color(0x33000000);
  static const Color black30 = Color(0x4D000000);
  static const Color black70 = Color(0xB3000000);
  static const Color scrim = Color(0x99000000); // For bottom sheets

  // Deep Night & Space (Blue/Cool Undertones)
  static const Color midnightBlue = Color(0xFF000C18);
  static const Color spaceCadet = Color(0xFF1D2951);
  static const Color oxfordBlue = Color(0xFF002147);
  static const Color abyss = Color(0xFF00030A);
  static const Color darkPrussian = Color(0xFF003153);
  static const Color darkCerulean = Color(0xFF08457E);
  static const Color indigoDye = Color(0xFF00416A);

  // Volcanic & Earthy Darks (Warm Undertones)
  static const Color richBlack = Color(0xFF010B13);
  static const Color darkChocolate = Color(0xFF1B1404);
  static const Color espresso = Color(0xFF2E1A16);
  static const Color darkAubergine = Color(0xFF280137);
  static const Color deepPlum = Color(0xFF36013F);
  static const Color raisinBlack = Color(0xFF242124);
  static const Color darkMahogany = Color(0xFF340E0E);

  // Technical & Industrial Greys (Neutral)
  static const Color graphite = Color(0xFF2B2B2B);
  static const Color ebon = Color(0xFF121212);
  static const Color onyx = Color(0xFF353839);
  static const Color jetBlack = Color(0xFF0A0A0A);
  static const Color outerSpace = Color(0xFF414A4C);
  static const Color darkGunmetal = Color(0xFF1F262A);
  static const Color oil = Color(0xFF1C1C1C);
  static const Color blackBean = Color(0xFF3D0C02);

  // Forest & Sea Darks (Green/Teal Undertones)
  static const Color deepJungle = Color(0xFF004B49);
  static const Color darkForest = Color(0xFF013220);
  static const Color darkEvergreen = Color(0xFF052F05);
  static const Color nightGreen = Color(0xFF00241B);
  static const Color deepTeal = Color(0xFF003333);
  static const Color phthaloGreen = Color(0xFF123524);

  // Dark Mode Surface Hierarchy (For Elevation)
  static const Color surface0 = Color(0xFF121212); // Base
  static const Color surface1 = Color(0xFF1E1E1E); // +1dp elevation
  static const Color surface2 = Color(0xFF222222); // +2dp elevation
  static const Color surface3 = Color(0xFF242424); // +3dp elevation
  static const Color surface4 = Color(0xFF272727); // +4dp elevation
  static const Color surface6 = Color(0xFF2C2C2C); // +6dp elevation
  static const Color surface8 = Color(0xFF2E2E2E); // +8dp elevation
  static const Color surface12 = Color(0xFF333333); // +12dp elevation

  // Deep Shaders & Transparent Scrims
  static const Color black95 = Color(0xF2000000); // 95% opacity
  static const Color black90 = Color(0xE6000000); // 90% opacity
  static const Color black85 = Color(0xD9000000); // 85% opacity
  static const Color deepShadow = Color(0x66000000);
  static const Color innerShadow = Color(0x4D000000);
  static const Color darkBlur = Color(0x33000000);

  // Muted Dark Accents
  static const Color mutedCrimson = Color(0xFF4E0707);
  static const Color mutedIndigo = Color(0xFF1A1A40);
  static const Color mutedOlive = Color(0xFF252B01);
  static const Color mutedSlate = Color(0xFF252930);
  static const Color smokyBlack = Color(0xFF100C08);

  // --- Modern Darks & Deep Tones ---

  static const Color raisin = Color(0xFF242124);
  static const Color charleston = Color(0xFF232B2B);

  // --- Earthy & Organic ---
  static const Color sageLeaf = Color(0xFF7E8D85);
  static const Color deepForest = Color(0xFF2D4032);
  static const Color terracotta = Color(0xFFD4A373);
  static const Color warmSand = Color(0xFFB3A394);
  static const Color oatmeal = Color(0xFFEAD7BB);
  static const Color oliveDrab = Color(0xFF606C38);
  static const Color burntSienna = Color(0xFFBC6C25);

  static const Color vanilla = Color(0xFFFEFAE0);
  static const Color darkMoss = Color(0xFF283618);

  // --- Nordic & Minimalist ---
  static const Color cloudDancer = Color(0xFFF1FAEE);
  static const Color ghostWhite = Color(0xFFF8F9FA);
  static const Color platinum = Color(0xFFE9ECEF);
  static const Color silverLake = Color(0xFFDEE2E6);

  static const Color slateGrey = Color(0xFFADB5BD);
  static const Color arcticBlue = Color(0xFFC7E8F3);
  static const Color mistGreen = Color(0xFFB7D5D4);
  static const Color paleMoss = Color(0xFFA2C3A4);
  static const Color nordicSky = Color(0xFF5F7ADB);

  // --- Cyberpunk & Tech Accents ---
  static const Color electricPurple = Color(0xFF7209B7);
  static const Color neonBlue = Color(0xFF4361EE);
  static const Color skylineBlue = Color(0xFF4895EF);
  static const Color cyberCyan = Color(0xFF4CC9F0);
  static const Color vividRaspberry = Color(0xFFE63946);
  static const Color tealWave = Color(0xFF2EC4B6);
  static const Color sunsetOrange = Color(0xFFFF9F1C);
  static const Color coralGables = Color(0xFFFFCAD4);
  static const Color tangerine = Color(0xFFFFBF69);

  // --- Muted Jewel & Pastel ---
  static const Color mauveMist = Color(0xFFFADADD);
  static const Color dustyRose = Color(0xFFF4ACB7);
  static const Color lavenderMist = Color(0xFF6D597A);
  static const Color mutedPlum = Color(0xFFB56576);
  static const Color sunsetPeach = Color(0xFFFFE5D9);
  static const Color berryJam = Color(0xFFE56B6F);

  static const Color eucalyptus = Color(0xFFD8E2DC);
  static const Color seaGlass = Color(0xFFA8DADC);
  static const Color morningMist = Color(0xFFCBF3F0);

  // --- Modern 2-3 Color Mixtures ---

  // 1. Minimalist Mono
  static const Color cloudGraphite = Color(0xFFF1FAEE); // Primary
  static const Color graphiteCloud = Color(0xFF2B2B2B); // Accent

  // 2. Midnight Luxury
  static const Color ebonGhost = Color(0xFF121212); // Background
  static const Color ghostEbon = Color(0xFFF8F9FA); // Text/Icon

  // 3. Industrial Slate
  static const Color onyxPlatinum = Color(0xFF353839);
  static const Color platinumOnyx = Color(0xFFE9ECEF);

  // 4. High Contrast Tech
  static const Color jetSlate = Color(0xFF0A0A0A);
  static const Color slateJet = Color(0xFFADB5BD);

  // 5. Deep Metallic
  static const Color oilSilver = Color(0xFF1C1C1C);
  static const Color silverOil = Color(0xFFDEE2E6);

  // 6. Nordic Night
  static const Color skyEbon = Color(0xFF5F7ADB);
  static const Color ebonSky = Color(0xFF121212);

  // 7. Forest Organic
  static const Color sageDeep = Color(0xFF7E8D85);
  static const Color deepSage = Color(0xFF2D4032);

  // 8. Desert Sunset
  static const Color sandTerra = Color(0xFFB3A394);
  static const Color terraSand = Color(0xFFD4A373);

  // 9. Autumn Harvest
  static const Color oatSienna = Color(0xFFEAD7BB);
  static const Color siennaOat = Color(0xFFBC6C25);

  // 10. Ancient Garden
  static const Color mossVanilla = Color(0xFF283618);
  static const Color vanillaMoss = Color(0xFFFEFAE0);

  // 11. Earthy Bold
  static const Color clayBean = Color(0xFFDDA15E);
  static const Color beanClay = Color(0xFF3D0C02);

  // 12. Olive Trio
  static const Color oliveClay = Color(0xFF606C38);
  static const Color clayVanilla = Color(0xFFDDA15E);
  static const Color vanillaOlive = Color(0xFFFEFAE0);

  // 13. Electric Noir
  static const Color purpleOnyx = Color(0xFF7209B7);
  static const Color onyxPurple = Color(0xFF353839);

  // 14. Neon Void
  static const Color neonJet = Color(0xFF4361EE);
  static const Color jetNeon = Color(0xFF0A0A0A);

  // 15. Cyber Metal
  static const Color cyanGunmetal = Color(0xFF4CC9F0);
  static const Color gunmetalCyan = Color(0xFF1F262A);

  // 16. Indigo Graphite
  static const Color indigoGraphite = Color(0xFF3F37C9);
  static const Color graphiteIndigo = Color(0xFF2B2B2B);

  // 17. Arctic Skyline
  static const Color skyArctic = Color(0xFF4895EF);
  static const Color arcticSky = Color(0xFFC7E8F3);

  // 18. Neon Fusion
  static const Color neonCyan = Color(0xFF4361EE);
  static const Color cyanEbon = Color(0xFF4CC9F0);
  static const Color ebonNeon = Color(0xFF121212);

  // 19. Rose Petal
  static const Color roseMauve = Color(0xFFF4ACB7);
  static const Color mauveRose = Color(0xFFFADADD);

  // 20. Plum Shadow
  static const Color plumGraphite = Color(0xFFB56576);
  static const Color graphitePlum = Color(0xFF2B2B2B);

  // 21. Lavender Mist
  static const Color lavenderGhost = Color(0xFF6D597A);
  static const Color ghostLavender = Color(0xFFF8F9FA);

  // 22. Coastal Breeze
  static const Color seaMorning = Color(0xFFA8DADC);
  static const Color morningSea = Color(0xFFCBF3F0);

  // 23. Peach Apricot
  static const Color peachApricot = Color(0xFFFFE5D9);
  static const Color apricotPeach = Color(0xFFEAAC8B);

  // 24. Berry Velvet
  static const Color berryMauve = Color(0xFFE56B6F);
  static const Color mauveBerry = Color(0xFFFADADD);
  static const Color ebonBerry = Color(0xFF121212);

  // 25. Crimson Plate
  static const Color raspberryPlatinum = Color(0xFFE63946);
  static const Color platinumRaspberry = Color(0xFFE9ECEF);

  // 26. Burnt Orange
  static const Color sunsetGraphite = Color(0xFFFF9F1C);
  static const Color graphiteSunset = Color(0xFF2B2B2B);

  // 27. Candy Pop
  static const Color tangerineCoral = Color(0xFFFFBF69);
  static const Color coralTangerine = Color(0xFFFFCAD4);

  // 28. Oceanic Tech
  static const Color tealGunmetal = Color(0xFF2EC4B6);
  static const Color gunmetalTeal = Color(0xFF1F262A);

  // 29. Frosted Mint
  static const Color arcticMoss = Color(0xFFC7E8F3);
  static const Color mossArctic = Color(0xFFA2C3A4);

  // 30. Fire & Ash
  static const Color raspberrySunset = Color(0xFFE63946);
  static const Color sunsetJet = Color(0xFFFF9F1C);
  static const Color jetFire = Color(0xFF0A0A0A);
}
